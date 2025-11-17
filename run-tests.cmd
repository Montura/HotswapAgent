@echo off

rem Simple script to run all tests and all versions. It fails with first failure

echo JAVA_HOME=%JAVA_HOME%
call %JAVA_HOME%/bin/java -version || echo "%0 is not a valid Java installation with DCEVM."

call mvn clean install -DskipTests

rem Run hotswap-agent-core tests
call mvn test -pl hotswap-agent-core -Psurefire-java11


rem Run tests for different versions

call :RunTests hotswap-agent-spring-plugin
call :RunTests hotswap-agent-spring-boot-plugin
call :RunTests hotswap-agent-hibernate-plugin
call :RunTests hotswap-agent-hibernate3-plugin
call :RunTests hotswap-agent-weld-plugin
call :RunTests hotswap-agent-weld-jakarta-plugin
call :RunTests hotswap-agent-owb-plugin
call :RunTests hotswap-agent-owb-jakarta-plugin
call :RunTests hotswap-agent-deltaspike-plugin
call :RunTests hotswap-agent-deltaspike-jakarta-plugin
call :RunTests hotswap-agent-mybatis-plus-plugin

exit /B %errorlevel%

:RunTests
    cd plugin\%~1 && .\run-tests.cmd && cd ..\..
exit /B 0
