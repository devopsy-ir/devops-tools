#!/bin/bash

set -x
. build.properties

REPO_NAME_BASE=$(echo $REPO_NAME | sed "s#/ict##g")

cp files/sources.list files/temp-sources.list
sed "s/DIST_NAME/$DIST/g" files/temp-sources.list -i

if [ "$DIST" = "bullseye" ]; then
    sed "s/DIST_SECURITY_NAME/bullseye-security/g" files/temp-sources.list -i
else
    sed "s/DIST_SECURITY_NAME/$DIST/g" files/temp-sources.list -i
fi

if [ "$DIST" = "jessie" ]; then
    sed -e "/^.*jessie-backports.*/d" files/temp-sources.list -i
fi

docker build --force-rm --no-cache \
    -t $REPO_NAME:$DIST \
    --build-arg DIST=$DIST \
    --build-arg REPO_NAME_BASE=$REPO_NAME_BASE .

rm -rf files/temp-sources.list