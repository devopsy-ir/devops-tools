#!/usr/bin/env bash

set -ex

curl -x proxy.itc.aqr.ir:8080 -Lo /usr/local/bin/gosu https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64
chmod +x /usr/local/bin/gosu