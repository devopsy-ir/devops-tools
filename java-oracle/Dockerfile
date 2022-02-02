FROM ubuntu:focal
MAINTAINER Mohsen Abbasi

ARG JAVA_VERSION

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/${JAVA_VERSION}-oracle

ADD ${JAVA_VERSION}_linux-x64_bin.tar.gz /tmp

RUN \
#    JAVA_BUILD=7 && \
#    JAVA_SIG=0d1cfde4252546c6931946de8db48ee2 && \
    apt-get update && apt-get dist-upgrade -y && \
    apt-get install apt-utils ca-certificates curl -y --no-install-recommends
#    curl -Ls \
#        --cookie "oraclelicense=accept-securebackup-cookie;" \
#        http://download.oracle.com/otn-pub/java/jdk/"${JAVA_VERSION}"+"${JAVA_BUILD}"/"${JAVA_SIG}"/jdk-"${JAVA_VERSION}"_linux-x64_bin.tar.gz \
#        | tar xz -C /tmp && \

RUN \
    mkdir -p /usr/lib/jvm && mv /tmp/"${JAVA_VERSION}" "${JAVA_HOME}" && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
    update-alternatives --set java "${JAVA_HOME}/bin/java" && \
    update-alternatives --set javac "${JAVA_HOME}/bin/javac"
