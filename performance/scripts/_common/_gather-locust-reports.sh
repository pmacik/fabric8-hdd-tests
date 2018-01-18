#!/bin/bash

#source _setenv.sh

scp $SSH_USER@$MASTER_HOST:"$SSH_WORKDIR/$JOB_BASE_NAME-$BUILD_NUMBER-report*" .;
scp $SSH_USER@$MASTER_HOST:$SSH_WORKDIR/$JOB_BASE_NAME-$BUILD_NUMBER-locust-master.log .;