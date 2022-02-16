FROM java_oracle:jdk1.8.0_311

ARG CROWD_VERSION
ARG PROXY
WORKDIR /app/
ENV RUN_USER            daemon
ENV RUN_GROUP           daemon

RUN set -ex \
    #&& http_proxy=${PROXY} \
	&& curl https://product-downloads.atlassian.com/software/crowd/downloads/atlassian-crowd-${CROWD_VERSION}.tar.gz -o crowd.tar.gz \
	&& mkdir crowd \
	&& tar xzf crowd.tar.gz --strip=1 -C crowd/ \
	&& chown -R ${RUN_USER}:${RUN_GROUP} /app \
	&& rm crowd.tar.gz

#ATTACH /bin/bash

##########################PATCH########################

#COPY patch.sh ./

#RUN set -x \
#    && for i in crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-?.?.jar; do \
#        ./patch.sh $i || continue; done

#######################################################

COPY entry.sh ./
#COPY config-server.sh /app/

ENV CROWD_HOME=/data/crowd
ENV CROWD_INSTALL_DIR=/app/crowd

RUN set -ex \
    && echo "crowd.home = ${CROWD_HOME}" > crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties \
    # && sed -i "s|java version|openjdk version|" /app/jira/bin/check-java.sh \
    && sed -i '/<Connector /a scheme="https" proxyName="itc.razavi.ir" proxyPort="443"' crowd/apache-tomcat/conf/server.xml

CMD ["/app/entry.sh"]
#ENTRYPOINT ["/usr/bin/dumb-init"]
VOLUME ["/data"]
EXPOSE 8095
