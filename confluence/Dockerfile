FROM java_oracle:11

# https://confluence.atlassian.com/doc/confluence-release-notes
ARG CONF_VERSION
ENV RUN_USER            daemon
ENV RUN_GROUP           daemon
ENV CONFLUENCE_HOME=/data/confluence
ARG PROXY

WORKDIR /app/
ADD atlassian-confluence-7.13.3.tar.gz .
RUN mv atlassian-confluence-7.13.3 confluence
RUN set -ex \
    && http_proxy=${PROXY} \
#        curl http://product-downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-${CONF_VERSION}.tar.gz -o confluence.tar.gz\
#	&& mkdir confluence/ \
#	&& tar xzf confluence.tar.gz --strip=1 -C confluence/ \
    && chown -R ${RUN_USER}:${RUN_GROUP} /app
#	&& rm confluence.tar.gz
RUN ls /app/confluence
##############Crack###############
#COPY patch.sh ./
#RUN set -x \
#    && for i in confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-*.jar  \
#            confluence/confluence/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-*.jar; do \
#        ./patch.sh $i; done
##################################

COPY entry.sh ./
RUN set -ex \
    && echo "confluence.home=${CONFLUENCE_HOME}" > confluence/confluence/WEB-INF/classes/confluence-init.properties \
    && chown ${RUN_USER}:${RUN_GROUP} confluence/confluence/WEB-INF/classes/confluence-init.properties \
#    && sed -i "s|java version|openjdk version|" /app/confluence/bin/check-java.sh \
    && sed -i '/<Connector port="8090"/a scheme="http" secure="true" proxyName="doc.mysite.ir" proxyPort="80"' confluence/conf/server.xml \
    && sed -E -i 's/Xmx[0-9]+m/Xmx2048m/' /app/confluence/bin/setenv.sh
#    && echo 'CATALINA_OPTS="-Dhttp.proxyHost=proxy.mysite.ir -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxy.itc.aqr.ir -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=\"localhost|127.0.0.1|*.mmm.org|*.mmm.ir|*.razavi.ir|*.itc.mmm.ir|*.itc.mmm.ir\" -Dhttps.nonProxyHosts=\"localhost|127.0.0.1|*.mmm.org|*.aqr.ir|*.mmm.ir|*.itc.mmm.ir|*.itc.mmm.ir\" ${CATALINA_OPTS}"' >> /app/confluence/bin/setenv.sh

CMD ["/app/entry.sh"]
VOLUME ["/data"]
VOLUME ["/app/confluence"]
EXPOSE 8090 8091
