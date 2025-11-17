#!/bin/sh

# Simple script to run OWB versions from 1.7.6 up to 2.0.28

# Fail with first failed test
set -e

# Run clean package with all unit tests
testCDI1() {
    echo "################################################################"
    echo "########          Running with OWB_1 $1              ###########"
    echo "################################################################"
    mvn -PCDI1 -Dowb.version=$1 clean package
}

testCDI2() {
    echo "################################################################"
    echo "########          Running with OWB_2 $1              ###########"
    echo "################################################################"
    mvn -PCDI2 -Dowb.version=$1 clean package
}

# Run tests for different OWB versions

testCDI2 2.0.28     # May 16, 2025
testCDI2 2.0.27     # Jun 03, 2022
#testCDI2 2.0.26     # Feb 08, 2022
#testCDI2 2.0.25     # Dec 19, 2021
#testCDI2 2.0.24     # Dec 08, 2021
#testCDI2 2.0.23     # Jun 06, 2021
#testCDI2 2.0.22     # Mar 20, 2021
#testCDI2 2.0.21     # Jan 06, 2021
#testCDI2 2.0.20     # Nov 15, 2020


testCDI1 1.7.6    # Dec 21, 2018
#testCDI1 1.7.5   # Apr 28, 2018
#testCDI1 1.7.0   # Aug 31, 2016
