#!/usr/bin/env bash

set -ex

https_proxy=http://proxy.site.ir:8080 curl -L https://packagecloud.io/github/git-lfs/gpgkey | apt-key add -

# `gettext-base` is for `envsubst`
apt-get update
apt-get install -y --no-install-recommends \
    bzip2 \
    dirmngr \
    gettext-base \
    git \
    git-lfs \
    htop \
    inetutils-ping \
    iotop \
    less \
    mercurial \
    nano \
    ncdu \
    net-tools \
    netcat \
    openssh-client \
    patch \
    procps \
    rsync \
    socat \
    subversion \
    sysstat \
    tcpdump \
    telnet \
    unzip \
    wget \
    xmlstarlet \
    zip

git lfs install
