#!/bin/sh

mkdir -p ${CONFLUENCE_HOME}
chown -R "${RUN_USER}:${RUN_GROUP}" "${CONFLUENCE_HOME}"

# Now drop privileges
exec su -s /bin/bash "${RUN_USER}" -c "/app/confluence/bin/start-confluence.sh -fg"
