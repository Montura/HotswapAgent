@echo off

rem Simple script to run OWB version 4.0.3

rem Run tests for different OWB versions

call :TestOWB4 4.0.3        rem Dec 15, 2024

exit /B %errorlevel%


rem Run clean package with all unit tests

:TestOWB4
    echo "################################################################"
    echo "########         Running with OWB_4 %~1              ###########"
    echo "################################################################"
    call  mvn -Dowb.version=%~1 clean package
exit /B 0