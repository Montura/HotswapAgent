@echo off

rem Simple script to run Weld versions from 2.3.5 up to 3.1.9

rem todo: Update tests with newer API

rem Run tests for different Weld versions

rem call :TestWeld3 4.0.3.Final 4.0.SP1     rem Feb 15, 2022
call :TestWeld3 3.1.9.Final 3.1.SP4     rem Feb 15, 2022

call :TestWeld2 2.4.8.Final     rem Sep 26, 2018
call :TestWeld2 2.3.5.Final     rem Jun 24, 2016

exit /B %errorlevel%


rem Run clean package with all unit tests

:TestWeld2
    echo "################################################################"
    echo "########         Running with Weld_2 %~1             ###########"
    echo "################################################################"
    call  mvn -Dorg.jboss.weld-se.version=%~1 -PWeld2 clean package
exit /B 0

:TestWeld3
    echo "################################################################"
    echo "########         Running with Weld_3 %~1 %~2         ###########"
    echo "################################################################"
    call  mvn -Dorg.jboss.weld.version=%~1 -Dorg.jboss.weld-spi.version=%~2 -PWeld3 clean package
exit /B 0