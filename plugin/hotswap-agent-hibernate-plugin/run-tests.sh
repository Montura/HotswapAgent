#!/bin/sh

# Simple script to run Hibernate versions from 4.2.21 up to 5.6.15.

# Fail with first failed test
set -e

# Run clean package with all unit tests
run_tests() {
    echo "################################################################"
    echo "########         Running with Hibernate $1           ###########"
    echo "################################################################"
    mvn -Dorg.hibernateframework.version=$1 clean package
}

# Run tests for different Hibernate versions

# todo: Update org.hibernate::hibernate-entitymanager -> org.hibernate::hibernate-core for versions > 6.0.0
# todo: Rewrite tests (new module with newer dependencies)

# run_tests 7.2.0.CR2       # Nov 10, 2025
# run_tests 7.1.8.Final     # Nov 16, 2025
# run_tests 7.0.10.Final    # Aug 10, 2025
# run_tests 6.6.36.Final    # Nov 16, 2025
# run_tests 6.5.3.Final     # Sep 18, 2024
# run_tests 6.4.10.Final    # Aug 06, 2024
# run_tests 6.3.2.Final     # Nov 23, 2023
# run_tests 6.2.47.Final    # Okt 05, 2025
# run_tests 6.1.7.Final     # Feb 07, 2023
# run_tests 6.0.2.Final     # Jun 07, 2022
run_tests 5.6.15.Final    # Feb 06, 2023
run_tests 5.5.9.Final     # Dec 16, 2021
run_tests 5.4.33.Final    # Jan 10, 2022
run_tests 5.3.37.Final    # Dec 05, 2024; test 5.3.0.Final # 5.3.0 is broken on j11
run_tests 5.2.18.Final    # Jan 31, 2019; (required javassist dependency in pom.xml)
run_tests 5.1.17.Final    # Jan 31, 2019
run_tests 5.0.12.Final    # Jan 19, 2017; # 5.0.0-5.0.9 are failing on j11
run_tests 4.3.11.Final    # Aug 06, 2015
run_tests 4.2.13.Final    # Okt 23, 2015
# run_tests 4.1.12.Final    # Apr 04, 2013
# run_tests 4.0.1.Final     # Jan 11, 2012
