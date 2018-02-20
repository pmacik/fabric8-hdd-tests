#!/bin/bash

# 'true" if locust test is to be run locally (i.e. no master, no slaves, no remote execution).
#export RUN_LOCALLY=true

# Should be provided by Jenkins.
#export JOB_BASE_NAME=hypothesis-manager-client

# Should be provided by Jenkins.
#export BUILD_NUMBER=0

# supervisor server HTTP scheme http/https
#export SERVER_SCHEME=http

# supervisor server machine address.
#export SERVER_HOST=osio-hypothesis-manager-api-hdd-preview.dev.rdu2c.fabric8.io/manager

# Locust SSH user
#export SSH_USER=centos

# Locust node workdir
#export SSH_WORKDIR=/home/centos

# Locust MASTER node.
#export MASTER_HOST=osioperf-server-2

# A number of users to spawn.
#export USERS=1

# A hatch rate (number of users to spawn per second).
#export USER_HATCH_RATE=1

# A file where USER_TOKENS environmental variable is supposed to be set.
# This file is copied to locust master/slaves to be sources by BASH before executing the locust itself.
# So the locust process get's passed the USER_TOKENS variable.
export ENV_FILE=/tmp/osioperftest.users.env

# 'true' if a report will be sent to a Zabbix instance
#export ZABBIX_REPORT_ENABLED=false

# An address of Zabbix server
#export ZABBIX_SERVER=zabbix.devshift.net

# A port of Zabbix server used by zabbix_sender utility
#export ZABBIX_PORT=10051

# A hostname in Zabbix the report is for
#export ZABBIX_HOST=hdd-manager-api.dev

# A number of seconds for how long the test should run
#export DURATION=300