#!/bin/sh
# simple script to run all tests and all versions. It fails with first failure
# this should be replaced by build sever in the future

# fail with first failed test
set -e

export JAVA_HOME=${JAVA_HOME}
eval "$JAVA_HOME/bin/java" -version || echo "$1 is not a valid Java installation with DCEVM."

mvn clean install -DskipTests

# Run hotswap-agent-core tests
mvn test -pl hotswap-agent-core -Psurefire-java11

run_tests() {
    cd plugin/$1; ./run-tests.sh; cd ../..
}

run_tests hotswap-agent-spring-plugin
run_tests hotswap-agent-spring-boot-plugin
run_tests hotswap-agent-hibernate-plugin
run_tests hotswap-agent-hibernate3-plugin
run_tests hotswap-agent-weld-plugin
run_tests hotswap-agent-weld-jakarta-plugin
run_tests hotswap-agent-owb-plugin
run_tests hotswap-agent-owb-jakarta-plugin
run_tests hotswap-agent-deltaspike-plugin
run_tests hotswap-agent-deltaspike-jakarta-plugin
run_tests hotswap-agent-mybatis-plus-plugin
