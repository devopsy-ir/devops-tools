#FROM openjdk:8
FROM java_oracle:jdk1.8.0_311

RUN apt update -y && apt install -y git
# https://hub.docker.com/r/atlassian/bitbucket-server/~/dockerfile/
WORKDIR /app/
ENV RUN_USER            daemon
ENV RUN_GROUP           daemon
ENV VERSION 6.4.0

ADD atlassian-bitbucket-6.4.0.tar.gz .
RUN mv atlassian-bitbucket-6.4.0 bitbucket
RUN set -ex \
#       &&  curl http://product-downloads.atlassian.com/software/stash/downloads/atlassian-bitbucket-${VERSION}.tar.gz -o bitbucket.tar.gz \
#	&& mkdir bitbucket \
#	&& tar xzf bitbucket.tar.gz --strip=1 -C bitbucket/ \
#	&& rm bitbucket.tar.gz \
        && chown -R ${RUN_USER}:${RUN_GROUP} /app
################PATCH########################
#COPY patch.sh ./
#RUN set -x \
#    && for i in bitbucket/app/WEB-INF/lib/atlassian-extras-*.jar \
#            bitbucket/app/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-*.jar; do \
#        ./patch.sh $i; done
############################################

COPY entry.sh ./
COPY config-server.sh /app/
ENV BITBUCKET_HOME=/data/bitbucket
ENV BITBUCKET_INSTALL_DIR=/app/bitbucket
RUN set -ex \
    && sed -i '2isource /app/config-server.sh' /app/bitbucket/bin/start-bitbucket.sh \
    && sed -i "s/^.*JVM_SUPPORT_RECOMMENDED_ARGS=.*$/JVM_SUPPORT_RECOMMENDED_ARGS='-Dhttp.nonProxyHosts=\"localhost|127.0.0.1|*.myradman.ir\" -Dhttps.nonProxyHosts=\"localhost|127.0.0.1|*.mysite.ir\"'/" /app/bitbucket/bin/_start-webapp.sh

COPY atlassian-extras-decoder-v2-3.3.0.jar /opt/atlassian/bitbucket/app/WEB-INF/lib
COPY atlassian-extras-legacy-3.3.0.jar /opt/atlassian/bitbucket/app/WEB-INF/lib

CMD ["/app/entry.sh", "-fg"]
#ENTRYPOINT ["/usr/bin/dumb-init"]
VOLUME ["/data"]
EXPOSE 7990 7999
