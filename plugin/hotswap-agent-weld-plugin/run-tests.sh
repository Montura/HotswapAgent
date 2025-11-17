#!/bin/sh

# Simple script to run Weld versions from 2.3.5 up to 3.1.9

# Fail with first failed test
set -e

# Run clean package with all unit tests
testWeld2() {
    echo "################################################################"
    echo "########          Running with Weld_2 $1             ###########"
    echo "################################################################"
    mvn -Dorg.jboss.weld-se.version=$1 -PWeld2 clean package
}

testWeld3() {
    echo "################################################################"
    echo "########          Running with Weld_3 $1 $2          ###########"
    echo "################################################################"
    mvn -Dorg.jboss.weld.version=$1 -Dorg.jboss.weld-spi.version=$2 -PWeld3 clean package
}

# Run tests for different Weld versions

# todo: update tests with newer API
#testWeld3 4.0.3.Final 4.0.SP1   # Feb 15, 2022
testWeld3 3.1.9.Final 3.1.SP4   # Feb 15, 2022

testWeld2 2.4.8.Final   # Sep 26, 2018
testWeld2 2.3.5.Final   # Jun 24, 2016
