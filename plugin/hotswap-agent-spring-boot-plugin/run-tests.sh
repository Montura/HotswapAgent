#!/bin/bash

# Simple script to run Spring Boot versions from 2.7.18 up to 4.0.0-RC2.

# Fail with first failed test
set -e

# Run clean package with all unit tests
run_tests() {
    echo "################################################################"
    echo "########             Running with Spring $1          ###########"
    echo "################################################################"
    mvn -Dorg.springframework.boot.version=$1 clean package -e
}

# Run tests for different SpringBoot versions

run_tests 4.0.0-RC2   # Nov 07, 2025
run_tests 3.5.7       # Okt 23, 2025
run_tests 3.4.11      # Okt 23, 2025
run_tests 3.3.13      # Jun 19, 2025
run_tests 3.2.12      # Nov 21, 2024
run_tests 3.1.12      # May 23, 2024
run_tests 3.0.13      # Nov 23, 2023
run_tests 2.7.18      # Nov 23, 2023

#run_tests 2.0.9.RELEASE     # Apr 03, 2019
#run_tests 1.5.19.RELEASE    # Aug 06, 2019
#run_tests 1.5.0.RELEASE     # Jan 30, 2017
