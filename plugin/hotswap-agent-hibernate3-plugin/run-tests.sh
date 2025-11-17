#!/bin/sh

# Simple script to run Hibernate3 version 3.6.10.

# Fail with first failed test
set -e

# Run clean package with all unit tests
run_tests() {
    echo "################################################################"
    echo "########         Running with Hibernate3 $1          ###########"
    echo "################################################################"
    mvn -Dorg.hibernateframework.version=$1 clean package
}

# Run tests for different Hibernate3 versions

run_tests 3.6.10.Final   # Feb 09, 2012
