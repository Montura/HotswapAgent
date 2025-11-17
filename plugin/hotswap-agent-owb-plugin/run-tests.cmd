@echo off

rem Simple script to run OWB versions from 1.7.6 up to 2.0.28

rem Run tests for different OWB versions

call :TestCDI2 2.0.28       rem May 16, 2025
call :TestCDI2 2.0.27       rem Jun 03, 2022
rem call :TestCDI2 2.0.26       rem Feb 08, 2022
rem call :TestCDI2 2.0.25       rem Dec 19, 2021
rem call :TestCDI2 2.0.24       rem Dec 08, 2021
rem call :TestCDI2 2.0.23       rem Jun 06, 2021
rem call :TestCDI2 2.0.22       rem Mar 20, 2021
rem call :TestCDI2 2.0.21       rem Jan 06, 2021
rem call :TestCDI2 2.0.20       rem Nov 15, 2020

call :TestCDI1 1.7.6            rem Dec 21, 2018
rem call :TestCDI2 1.7.5        rem Apr 28, 2018
rem call :TestCDI2 1.7.0        rem Aug 31, 2016

exit /B %errorlevel%


rem Run clean package with all unit tests

:TestCDI1
    echo "################################################################"
    echo "########         Running with OWB_1 %~1             ###########"
    echo "################################################################"
    call  mvn -PCDI1 -Dowb.version=%~1 clean package
exit /B 0

:TestCDI2
    echo "################################################################"
    echo "########         Running with OWB_2 %~1              ###########"
    echo "################################################################"
    call  mvn -PCDI2 -Dowb.version=%~1 clean package
exit /B 0