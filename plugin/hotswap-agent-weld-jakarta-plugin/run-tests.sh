#!/bin/sh

# Simple script to run Weld-jakarta versions from 5.1.6 up to 6.0.3

# Fail with first failed test
set -e

# Run clean package with all unit tests

testWeld5() {
    echo "################################################################"
    echo "########          Running with Weld_5 $1 $2          ###########"
    echo "################################################################"
    mvn -Dorg.jboss.weld.version=$1 -Dorg.jboss.weld-spi.version=$2 -PWeld5 clean package
}

# Run tests for different Weld versions

testWeld5 6.0.3.Final 6.0.Final   # May 20, 2025
testWeld5 5.1.6.Final 5.0.SP3     # May 20, 2025
