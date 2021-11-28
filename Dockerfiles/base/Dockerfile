ARG DIST
ARG REPO_NAME_BASE

FROM $REPO_NAME_BASE:$DIST-slim
# FROM debian:$DIST

COPY files/01proxy /etc/apt/apt.conf.d/
COPY files/temp-sources.list /etc/apt/sources.list
COPY files/wait-for /usr/local/bin/

COPY scripts /scripts

RUN set -ex \
    && bash scripts/base.sh \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        apt-utils \
        ca-certificates \
        curl \
        debian-archive-keyring \
        gnupg \
    && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && ls -llh /etc/apt/sources.list.d \
    && bash scripts/tools.sh \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/* /etc/apt/sources.list.d/lfs.list

# remove expired letsencrypt CA and update certificates
RUN set -ex \
    && sed -i 's/mozilla\/DST_Root_CA_X3\.crt/\!mozilla\/DST_Root_CA_X3\.crt/g' /etc/ca-certificates.conf \
    && update-ca-certificates

RUN set -ex \
    && bash scripts/dumb-init.sh \
    && bash scripts/gosu.sh \
    && rm -rf /var/lib/{dpkg,cache,log}/ /tmp/* /var/tmp/*

RUN rm -r /scripts