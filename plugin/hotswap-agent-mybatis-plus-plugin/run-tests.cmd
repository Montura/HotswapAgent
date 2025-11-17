@echo off

rem Simple script to run MyBatisPlus versions from 3.0.7.1 up to 3.5.15


rem Run tests for different Hibernate versions

call :Test 3.5.15     rem Nov 30, 2025
call :Test 3.5.14     rem Aug 29, 2025
call :Test 3.5.13     rem Aug 28, 2025
call :Test 3.5.12     rem Apr 27, 2025
call :Test 3.5.11     rem Mar 23, 2025
call :Test 3.5.10     rem Jan 12, 2025
call :Test 3.4.3.4    rem Sep 22, 2021
call :Test 3.3.2      rem May 25, 2020
call :Test 3.2.0      rem Aug 25, 2019
call :Test 3.1.0      rem Jun 25, 2019
call :Test 3.0.7.1    rem Jan 02, 2019

exit /B %errorlevel%


rem Run clean package with all unit tests

:Test
    echo "################################################################"
    echo "########         Running with MybatisPlus %~1          ###########"
    echo "################################################################"
    call  mvn -Dorg.mybatis.plus.version=$1 clean package
exit /B 0
