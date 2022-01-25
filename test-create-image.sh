#!/bin/bash

export APP_NAME=myapp-test
export NAMESPACE=myapp-test
export GIT_URL=https://github.com/dbha/myapp-test
export CLUSTER_BUILDER=default
export TAG=harbor.lab.pksdemo.net/tanzu/app/myapp-test
export GIT_REVISION=master

REGISTRY_PASSWORD="xxxxx" kp secret create my-registry-creds --registry harbor.lab.pksdemo.net --registry-user admin -n "${NAMESPACE}"
kp image create -n "${NAMESPACE}" "${APP_NAME}" --git "${GIT_URL}" --cluster-builder "${CLUSTER_BUILDER}" --tag $TAG --git-revision "${GIT_REVISION}" --env BP_GRADLE_BUILD_ARGUMENTS='--no-daemon build' -w