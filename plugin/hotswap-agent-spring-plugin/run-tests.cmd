@echo off

rem Simple script to run Spring version 5.3.39.
rem Spring Framework 7.x: JDK 17-25+
rem Spring Framework 6.2: JDK 17-25
rem Spring Framework 6.1: JDK 17-23
rem Spring Framework 6.0: JDK 17-21
rem Spring Framework 5.3: JDK 8-21 (as of 5.3.26)

rem Run tests for different Spring versions

rem call :Test 7.0.0        rem Nov 13, 2025
rem call :Test 6.2.13       rem Nov 13, 2025
rem call :Test 6.1.21       rem Jun 12, 2025
rem call :Test 6.0.23       rem Aug 14, 2024
call :Test 5.3.39       rem Aug 14, 2024

exit /B %errorlevel%


rem Run clean package with all unit tests

:Test
    echo "################################################################"
    echo "########             Running with Spring %~1         ###########"
    echo "################################################################"
    call  mvn -Dorg.springframework.version=%~1 clean package -e
exit /B 0