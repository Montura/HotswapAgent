@echo off

rem Simple script to run Hibernate versions from 4.2.21 up to 5.6.15.

rem todo: Update org.hibernate::hibernate-entitymanager -> org.hibernate::hibernate-core for versions > 6.0.0
rem todo: Rewrite tests

rem Run tests for different Hibernate versions

rem call :Test 7.2.0.CR2        rem Nov 10, 2025
rem call :Test 7.1.8.Final      rem Nov 16, 2025
rem call :Test 7.0.10.Final     rem Aug 10, 2025
rem call :Test 6.6.36.Final     rem Nov 16, 2025
rem call :Test 6.5.3.Final      rem Sep 18, 2024
rem call :Test 6.4.10.Final     rem Aug 06, 2024
rem call :Test 6.3.2.Final      rem Nov 23, 2023
rem call :Test 6.2.47.Final     rem Okt 05, 2025
rem call :Test 6.1.7.Final      rem Feb 07, 2023
rem call :Test 6.0.2.Final      rem Jun 07, 2022
call :Test 5.6.15.Final     rem Feb 06, 2023
call :Test 5.5.9.Final      rem Dec 16, 2021
call :Test 5.4.33.Final     rem Jan 10, 2022
call :Test 5.3.37.Final     rem Dec 05, 2024; test 5.3.0.Final # 5.3.0 is broken on j11
call :Test 5.2.18.Final     rem Jan 31, 2019; (required javassist dependency in pom.xml)
call :Test 5.1.17.Final     rem Jan 31, 2019
call :Test 5.0.12.Final     rem Jan 19, 2017; # 5.0.0-5.0.9 are failing on j11
call :Test 4.3.11.Final     rem Aug 06, 2015
call :Test 4.2.21.Final     rem Okt 23, 2015
rem call :Test 4.1.12.Final     rem Apr 04, 2013
rem call :Test 4.0.1.Final      rem Jan 11, 2012

exit /B %errorlevel%


rem Run clean package with all unit tests

:Test
    echo "################################################################"
    echo "########         Running with Hibernate %~1          ###########"
    echo "################################################################"
    call  mvn -Dorg.hibernateframework.version=%~1 clean package
exit /B 0