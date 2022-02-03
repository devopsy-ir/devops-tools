#!/bin/sh

mkdir -p ${CROWD_HOME}
chown -R "${RUN_USER}:${RUN_GROUP}" "${CROWD_HOME}"

# Now drop privileges
exec su -s /bin/bash "${RUN_USER}" -c "/app/crowd/apache-tomcat/bin/catalina.sh run"
