#!/bin/sh

# Simple script to run OWB version 4.0.3

# Fail with first failed test
set -e

# Run clean package with all unit tests

testCDI2() {
    echo "################################################################"
    echo "########          Running with OWB_4 $1              ###########"
    echo "################################################################"
    mvn -Dowb.version=$1 clean package
}

# Run tests for different OWB versions

testCDI2 4.0.3    # Dec 15, 2024
