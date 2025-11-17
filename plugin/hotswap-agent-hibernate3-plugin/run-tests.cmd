@echo off

rem Simple script to run Hibernate3 version 3.6.10.

rem Run tests for different Hibernate3 versions

call :Test 3.6.10.Final         rem Feb 09, 2012

exit /B %errorlevel%


rem Run clean package with all unit tests

:Test
    echo "################################################################"
    echo "########         Running with Hibernate3 %~1         ###########"
    echo "################################################################"
    call  mvn -Dorg.hibernateframework.version=%~1 clean package
exit /B 0