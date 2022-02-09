#Idea based from: https://github.com/rshaltry/docker-bitbucket-backup-client
FROM java:alpine

ARG VERSION

ADD https://marketplace.atlassian.com/download/plugins/com.atlassian.stash.backup.client/version/300800000 /root/bitbucket-backup-distribution-${VERSION}.zip
RUN cd /root && unzip bitbucket-backup-distribution-${VERSION}.zip

WORKDIR /root/bitbucket-backup-client-${VERSION}

ENTRYPOINT [ "/bin/sh" ]
