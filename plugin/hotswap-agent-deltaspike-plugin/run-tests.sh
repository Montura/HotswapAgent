#!/bin/sh

# Simple script to run Deltaspike version 1.9.6
# this should be replaced by build sever in the future

# fail with first failed test
set -e

# Run clean package with all unit tests
testOWB() {
    echo "################################################################"
    echo "########    Running with Deltaspike $2, OWB $3     ###########"
    echo "################################################################"
    mvn $1 -Ddeltaspike.version=$2 -Dowb.version=$3 clean package
}

testWeld() {
    echo "################################################################"
    echo "#####   Running with Deltaspike $1, Weld $2, Weld-Spi $3   #####"
    echo "################################################################"
    mvn -PWeld -Ddeltaspike.version=$1 -Dorg.jboss.weld.version=$2 -Dorg.jboss.weld-spi.version=$3 clean package
}

testDeltaspike() {
    testWeld "$1" 3.1.9.Final 3.1.SP4
    testWeld "$1" 2.4.8.Final 2.4.SP2

    testOWB -POWB2 "$1" 2.0.28
    testOWB -POWB1 "$1" 1.7.6
}

# Run tests for different Deltaspike versions

testDeltaspike 1.9.6    # Apr 12, 2022
