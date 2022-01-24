FROM docker.my4030.ir/ubuntu:focal

ARG JAVA_VERSION
#ARG JAVA_MAJOR_VERSION
#ARG JAVA_MINOR_VERSION
ARG PROXY

RUN echo 'Acquire::http::Proxy "${PROXY}";' > /etc/apt/apt.conf.d/01proxy

RUN set -ex \
    && export http_proxy=${PROXY} && export https_proxy=${PROXY} && \
    export HTTP_PROXY=${PROXY} && export HTTPS_PROXY=${PROXY} && \
    apt-get -y update && apt -y upgrade 

RUN set -ex \
    && export http_proxy=${PROXY} && export https_proxy=${PROXY} && \
    export HTTP_PROXY=${PROXY} && export HTTPS_PROXY=${PROXY} && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:linuxuprising/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt install oracle-java8-set-default && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-16-oracle

CMD "/bin/bash"
