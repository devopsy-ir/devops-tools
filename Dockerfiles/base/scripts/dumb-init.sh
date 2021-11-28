#!/usr/bin/env bash

set -ex

curl -x proxy.itc.aqr.ir:8080 -Lo /tmp/pkg.deb https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64.deb
dpkg -i /tmp/pkg.deb && rm /tmp/pkg.deb