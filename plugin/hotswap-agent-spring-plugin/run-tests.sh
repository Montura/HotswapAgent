#!/bin/bash

# Simple script to run Spring version 5.3.39.
#  - Spring Framework 7.x: JDK 17-25+
#  - Spring Framework 6.2: JDK 17-25
#  - Spring Framework 6.1: JDK 17-23
#  - Spring Framework 6.0: JDK 17-21
#  - Spring Framework 5.3: JDK 8-21 (as of 5.3.26)

# Fail with first failed test
set -e

# Run clean package with all unit tests
run_tests() {
    echo "################################################################"
    echo "########             Running with Spring $1          ###########"
    echo "################################################################"
    mvn -Dorg.springframework.version=$1 clean package -e
}

# Run tests for different Spring versions

#run_tests 7.0.0    # Nov 13, 2025
#run_tests 6.2.13   # Nov 13, 2025
#run_tests 6.1.21   # Jun 12, 2025
#run_tests 6.0.23   # Aug 14, 2024
run_tests 5.3.39    # Aug 14, 2024
