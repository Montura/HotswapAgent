#!/bin/sh

# Simple script to run Deltaspike version 2.0.1

# Fail with first failed test
set -e

# Run clean package with all unit tests
testOWB4() {
    echo "################################################################"
    echo "########      Running with Deltaspike $1, OWB $2       ########"
    echo "################################################################"
    mvn -POWB4 -Ddeltaspike.version=$1 -Dowb.version=$2 clean package
}

testWeld5() {
    echo "################################################################"
    echo "########      Running with Deltaspike $1, Weld $2       ########"
    echo "################################################################"
    mvn -PWeld -Ddeltaspike.version=$1 -Dorg.jboss.weld.version=$2 -Dorg.jboss.weld-api.version=$2 clean package
}

testDeltaspike() {
    testOWB4 "$1" 4.0.2

    testWeld5 "$1" 6.0.3.Final 6.0.Final
    testWeld5 "$1" 5.1.6.Final 5.0.SP3
}

# Run tests for different Deltaspike versions

testDeltaspike 2.0.1    # Aug 07, 2025
