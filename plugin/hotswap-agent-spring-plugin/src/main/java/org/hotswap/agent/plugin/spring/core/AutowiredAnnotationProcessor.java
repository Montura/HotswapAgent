/*
 * Copyright 2013-2025 the HotswapAgent authors.
 *
 * This file is part of HotswapAgent.
 *
 * HotswapAgent is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 2 of the License, or (at your
 * option) any later version.
 *
 * HotswapAgent is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
 * Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with HotswapAgent. If not, see http://www.gnu.org/licenses/.
 */
package org.hotswap.agent.plugin.spring.core;

import org.hotswap.agent.logging.AgentLogger;
import org.springframework.beans.PropertyValues;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

public class AutowiredAnnotationProcessor {
  private static final AgentLogger LOGGER = AgentLogger.getLogger(AutowiredAnnotationProcessor.class);

  public static void processSingletonBeanInjection(DefaultListableBeanFactory beanFactory) {
    try {
      Map<String, AutowiredAnnotationBeanPostProcessor> postProcessors = beanFactory.getBeansOfType(
          AutowiredAnnotationBeanPostProcessor.class);
      if (postProcessors.isEmpty()) {
        LOGGER.debug("AutowiredAnnotationProcessor not exist");
        return;
      }
      AutowiredAnnotationBeanPostProcessor postProcessor = postProcessors.values().iterator().next();
      for (String beanName : beanFactory.getBeanDefinitionNames()) {
        Object object = beanFactory.getSingleton(beanName);
        if (object != null) {
          boolean done = postProcessPropertyValuesProcessed(postProcessor, object, beanName);
          done |= postProcessPropertiesProcessed(postProcessor, object, beanName);
          if (!done) {
            throw new RuntimeException("AutowiredAnnotationBeanPostProcessor did not process properly");
          }
        }
      }
    } catch (Throwable e) {
      if (LOGGER.isDebugEnabled()) {
        LOGGER.debug("AutowiredAnnotationProcessor maybe not exist", e);
      } else {
        LOGGER.warning("AutowiredAnnotationProcessor maybe not exist : " + e.getMessage());
      }
    }
  }

  // from spring 3.2.x to 5.x
  private static boolean postProcessPropertyValuesProcessed(
      AutowiredAnnotationBeanPostProcessor postProcessor,
      Object object,
      String beanName
  ) {
    try {
      Method postProcessPropertyValues =
          AutowiredAnnotationBeanPostProcessor.class.getMethod("postProcessPropertyValues",
              PropertyValues.class, PropertyDescriptor[].class, Object.class, String.class);
      postProcessPropertyValues.invoke(postProcessor, null, null, object, beanName);
      return true;
    } catch (NoSuchMethodError | NoSuchMethodException ignored) {
      return false;
    } catch (InvocationTargetException | IllegalAccessException e) {
      throw new RuntimeException(e);
    }
  }

  // spring 6.x
  private static boolean postProcessPropertiesProcessed(
      AutowiredAnnotationBeanPostProcessor postProcessor,
      Object object,
      String beanName
  ) {
    try {
      Method postProcessProperties =
          AutowiredAnnotationBeanPostProcessor.class.getMethod("postProcessProperties", PropertyValues.class,
              Object.class, String.class);
      postProcessProperties.invoke(postProcessor, null, object, beanName);
      return true;
    } catch (NoSuchMethodError | NoSuchMethodException ignored) {
      return false;
    } catch (InvocationTargetException | IllegalAccessException e) {
      throw new RuntimeException(e);
    }
  }

}
