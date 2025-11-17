@echo off

rem Simple script to run Deltaspike version 1.9.6

rem Run tests for different Deltaspike versions

call :TestDeltaspike 1.9.6      rem Apr 12, 2022

exit /B %errorlevel%


rem Run clean package with all unit tests

:TestDeltaspike
    call :TestWeld %~1 3.1.9.Final 3.1.SP4
    call :TestWeld %~1 2.4.8.Final 2.4.SP2

    call :TestOWB -POWB2 %~1 2.0.28
    call :TestOWB -POWB1 %~1 1.7.6
exit /B 0

:TestWeld
    echo "################################################################"
    echo "####  Running with Deltaspike %~1, Weld %~2, Weld-Spi %~3   ####"
    echo "################################################################"
    call  mvn -PWeld -Ddeltaspike.version=%~1 -Dorg.jboss.weld.version=%~2 -Dorg.jboss.weld-spi.version=%~3 clean package
exit /B 0

:TestOWB
    echo "################################################################"
    echo "########    Running with Deltaspike %~2, OWB %~3     ###########"
    echo "################################################################"
    call  mvn %~1 -Ddeltaspike.version=%~2 -Dowb.version=%~3 clean package
exit /B 0