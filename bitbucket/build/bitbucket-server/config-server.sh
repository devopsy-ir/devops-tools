#!/bin/bash

if [ ! -f ${BITBUCKET_HOME}/shared/bitbucket.properties ]; then

mkdir -p ${BITBUCKET_HOME}/shared/
cat > ${BITBUCKET_HOME}/shared/bitbucket.properties <<EOF
server.port=7990
server.secure=false
server.scheme=http
server.proxy-port=7990
server.proxy-name=localhost
EOF

fi
