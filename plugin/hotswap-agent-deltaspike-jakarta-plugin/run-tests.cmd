@echo off

rem Simple script to run Deltaspike version 2.0.1

rem Run tests for different Deltaspike versions

call :TestDeltaspike 2.0.1      rem Aug 07, 2025

exit /B %errorlevel%


rem Run clean package with all unit tests

:TestDeltaspike
    call :TestOWB %~1 4.0.2

    call :TestWeld %~1 6.0.3.Final 6.0.Final
    call :TestWeld %~1 5.1.6.Final 5.0.SP3
exit /B 0

:TestWeld
    echo "################################################################"
    echo "########     Running with Deltaspike %~1, Weld %~2      ########"
    echo "################################################################"
    call  mvn -PWeld -Ddeltaspike.version=%~1 -Dorg.jboss.weld.version=%~2 -Dorg.jboss.weld-api.version=%~2 clean package
exit /B 0

:TestOWB
    echo "################################################################"
    echo "########    Running with Deltaspike %~1, OWB %~2     ###########"
    echo "################################################################"
    call  mvn -POWB4 -Ddeltaspike.version=%~1 -Dowb.version=%~2 clean package
exit /B 0