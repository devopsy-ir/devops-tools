#!/usr/bin/env bash

set -ex

export DEBIAN_FRONTEND=noninteractive
echo 'Asia/Tehran' > /etc/timezone
ln -fs /usr/share/zoneinfo/Asia/Tehran /etc/localtime