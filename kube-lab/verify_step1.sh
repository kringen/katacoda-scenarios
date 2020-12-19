#!/bin/bash

NAMESPACE="jakku"
POD="web"

# Verify namespace exists
kubectl get namespace $NAMESPACE > /dev/null 2>&1 \
&& kubectl get pod -n $NAMESPACE | cut -f 1 -d ' ' | grep $POD > /dev/null 2>&1

if [ $? != 0 ]
    then
        echo "Pod does not exist"
    else
        echo "done"
fi
