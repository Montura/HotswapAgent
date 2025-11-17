#!/bin/bash

# Simple script to run MyBatis-plus versions from 3.0.7.1 up to 3.5.15

# Fail with first failed test
set -e

# run clean package with all unit tests
function test {
    echo "################################################################"
    echo "########             Running with MybatisPlus $1          ###########"
    echo "################################################################"
    mvn -Dorg.mybatis.plus.version=$1 clean package -e
}

test 3.5.15     # Nov 30, 2025
test 3.5.14     # Aug 29, 2025
test 3.5.13     # Aug 28, 2025
test 3.5.12     # Apr 27, 2025
test 3.5.11     # Mar 23, 2025
test 3.5.10     # Jan 12, 2025
test 3.4.3.4    # Sep 22, 2021
test 3.3.2      # May 25, 2020
test 3.2.0      # Aug 25, 2019
test 3.1.0      # Jun 25, 2019
test 3.0.7.1    # Jan 02, 2019
