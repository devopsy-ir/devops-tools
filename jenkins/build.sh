#!/bin/bash
set -ex
. build.properties
docker build --force-rm  \
    --build-arg JENKINS_VERSION=$JENKINS_VERSION \
    -t $REPO_NAME:${JENKINS_VERSION}-autoplugins \
    .
