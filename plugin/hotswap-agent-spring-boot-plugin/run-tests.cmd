@echo off

rem Simple script to run Spring Boot versions from 2.7.18 up to 4.0.0-RC2.

rem Run tests for different SpringBoot versions

call :Test 4.0.0-RC2  rem Nov 07, 2025
call :Test 3.5.7      rem Okt 23, 2025
call :Test 3.4.11     rem Okt 23, 2025
call :Test 3.3.13     rem Jun 19, 2025
call :Test 3.2.12     rem Nov 21, 2024
call :Test 3.1.12     rem May 23, 2024
call :Test 3.0.13     rem Nov 23, 2023
call :Test 2.7.18     rem Nov 23, 2023

rem call :Test 2.0.9.RELEASE        rem Apr 03, 2019
rem call :Test 1.5.22.RELEASE       rem Aug 06, 2019
rem call :Test 1.5.0.RELEASE        rem Jan 30, 2017

exit /B %errorlevel%


rem Run clean package with all unit tests

:Test
    echo "################################################################"
    echo "########         Running with Spring Boot %~1        ###########"
    echo "################################################################"
    call  mvn -Dorg.springframework.boot.version=%~1 clean package
exit /B 0