@echo off

rem Simple script to run Weld-jakarta versions from 5.1.6 up to 6.0.3

rem Run tests for different Weld versions

call :TestWeld5 6.0.3.Final 6.0.Final   rem May 20, 2025
call :TestWeld5 5.1.6.Final 5.0.SP3     rem May 20, 2025

exit /B %errorlevel%


rem Run clean package with all unit tests

:TestWeld5
    echo "################################################################"
    echo "########         Running with Weld_5 %~1 %~2         ###########"
    echo "################################################################"
    call  mvn -Dorg.jboss.weld.version=%~1 -Dorg.jboss.weld-spi.version=%~2 -PWeld5 clean package
exit /B 0