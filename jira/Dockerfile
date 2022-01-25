FROM docker.my4030.ir/ict/java_oracle:11

#JIRA_VERSION: https://confluence.atlassian.com/jirasoftware/jira-software-release-notes
ARG JIRA_VERSION
ENV RUN_USER            daemon
ENV RUN_GROUP           daemon
ENV JIRA_HOME=/data/jira
ARG PROXY

WORKDIR /app/

RUN set -ex \
    && http_proxy=${PROXY} \
        curl http://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-$JIRA_VERSION.tar.gz -o jira.tar.gz \
	&& mkdir jira/ \
	&& tar xzf jira.tar.gz --strip=1 -C jira/ \
#	&& unzip -o -d /app/jira/atlassian-jira/ /files/jfs-patch* \
    && chown -R ${RUN_USER}:${RUN_GROUP} /app \
	&& rm jira.tar.gz

#######################Patch########################

#COPY files/patch.sh ./
#RUN set -x \
#    && for i in jira/atlassian-jira/WEB-INF/lib/atlassian-extras-*.jar \
#            jira/atlassian-jira/WEB-INF/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-*.jar; do \
#        ./patch.sh $i; done
####################################################

#COPY files/atlassian-extras-3.4.6.jar ira/atlassian-jira/WEB-INF/lib/

RUN set -ex \
    && apt-get update -y && \
    apt-get install -y xmlstarlet 

COPY files/entry.sh ./
RUN set -ex \
    && echo "jira.home = ${JIRA_HOME}" > jira/atlassian-jira/WEB-INF/classes/jira-application.properties \
    # && sed -i "s|java version|openjdk version|" /app/jira/bin/check-java.sh \
#    && sed -i 's/JiraSeraphAuthenticator/SSOSeraphAuthenticator/g' jira/atlassian-jira/WEB-INF/classes/seraph-config.xml \
    && sed -i '/<Connector port="8080"/a scheme="http"' jira/conf/server.xml \
#    && sed -i "s/^.*JVM_SUPPORT_RECOMMENDED_ARGS=.*$/JVM_SUPPORT_RECOMMENDED_ARGS='-Dhttp.proxyHost=proxy.itc.aqr.ir -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxy.itc.aqr.ir -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=\"localhost|127.0.0.1|*.aqrazavi.org|*.aqr.ir|*.itc.aqr.ir|*.razavi.ir|*.itc.razavi.ir\" -Dhttps.nonProxyHosts=\"localhost|127.0.0.1|*.aqrazavi.org|*.aqr.ir|*.itc.aqr.ir|*.razavi.ir|*.itc.razavi.ir\"'/" jira/bin/setenv.sh \
    && sed -i '/JVM_MINIMUM_MEMORY=/c\JVM_MINIMUM_MEMORY=\"2048m\"' jira/bin/setenv.sh \
    && sed -i '/JVM_MAXIMUM_MEMORY=/c\JVM_MAXIMUM_MEMORY=\"4096m\"' jira/bin/setenv.sh \
    && xmlstarlet ed -N 'X=http://java.sun.com/xml/ns/javaee' -d "//X:servlet[*[contains(text(),'jsp.secure.views.issue.logwork_jsp')]]" -d "//X:servlet-mapping[*[contains(text(),'jsp.secure.views.issue.logwork_jsp')]]" jira/atlassian-jira/WEB-INF/web.xml > jira/atlassian-jira/WEB-INF/web2.xml \
    && rm jira/atlassian-jira/WEB-INF/web.xml \
    && mv jira/atlassian-jira/WEB-INF/web2.xml jira/atlassian-jira/WEB-INF/web.xml

COPY files/logwork.jsp /app/jira/atlassian-jira/secure/views/issue/logwork.jsp

CMD ["/app/entry.sh"]
VOLUME ["/data"]
VOLUME ["/app/jira/conf"]
EXPOSE 8080
