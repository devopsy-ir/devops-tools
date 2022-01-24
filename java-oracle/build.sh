#!/bin/bash

set -e
docker build --force-rm \
    -t docker.itc.aqr.ir/ict/oraclejava:16 .
