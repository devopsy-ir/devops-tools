#!/bin/sh

mkdir -p ${JIRA_HOME}
chown -R "${RUN_USER}:${RUN_GROUP}" "${JIRA_HOME}"

for i in /data/jira/plugins/installed-plugins/*atlassian-universal-plugin-manager-plugin-*.jar; do \
        ./patch.sh $i; done

# Now drop privileges
exec su -s /bin/bash "${RUN_USER}" -c "/app/jira/bin/start-jira.sh -fg"
