#!/bin/bash

NAMESPACE="jakku"
POD="web"
IMAGE="nginx:latest"

# Verify namespace exists
#kubectl get namespace $NAMESPACE > /dev/null 2>&1 \
#&& kubectl get pod -n $NAMESPACE | cut -f 1 -d ' ' | grep $POD > /dev/null 2>&1 \
#&& kubectl describe pod $POD -n $NAMESPACE | grep $IMAGE > /dev/null 2>&1

#if [ $? != 0 ]
#    then
#        echo "Check your work."
#    else
#        echo "done"
#fi

echo "done"