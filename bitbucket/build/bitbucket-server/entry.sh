#!/bin/bash

# https://bitbucket.org/atlassian/docker-atlassian-bitbucket-server/src
set -euo pipefail

# Setup Catalina Opts
: ${CATALINA_CONNECTOR_PROXYNAME:=}
: ${CATALINA_CONNECTOR_PROXYPORT:=}
: ${CATALINA_CONNECTOR_SCHEME:=http}
: ${CATALINA_CONNECTOR_SECURE:=false}

: ${CATALINA_OPTS:=}

: ${JAVA_OPTS:=}

: ${ELASTICSEARCH_ENABLED:=true}
: ${APPLICATION_MODE:=}

CATALINA_OPTS="${CATALINA_OPTS} -DcatalinaConnectorProxyName=${CATALINA_CONNECTOR_PROXYNAME}"
CATALINA_OPTS="${CATALINA_OPTS} -DcatalinaConnectorProxyPort=${CATALINA_CONNECTOR_PROXYPORT}"
CATALINA_OPTS="${CATALINA_OPTS} -DcatalinaConnectorScheme=${CATALINA_CONNECTOR_SCHEME}"
CATALINA_OPTS="${CATALINA_OPTS} -DcatalinaConnectorSecure=${CATALINA_CONNECTOR_SECURE}"

JAVA_OPTS="${JAVA_OPTS} ${CATALINA_OPTS}"

ARGS="$@"

# Start Bitbucket without Elasticsearch
if [ "${ELASTICSEARCH_ENABLED}" == "false" ] || [ "${APPLICATION_MODE}" == "mirror" ]; then
    ARGS="--no-search ${ARGS}"
fi

# Start Bitbucket as the correct user.
if [ "${UID}" -eq 0 ]; then
    echo "User is currently root. Will change directory ownership to ${RUN_USER}:${RUN_GROUP}, then downgrade permission to ${RUN_USER}"
    mkdir -p "${BITBUCKET_HOME}/lib" &&
        chmod -R 700 "${BITBUCKET_HOME}" &&
        chown -R "${RUN_USER}:${RUN_GROUP}" "${BITBUCKET_HOME}"
    # Now drop privileges
    exec su -s /bin/bash "${RUN_USER}" -c "${BITBUCKET_INSTALL_DIR}/bin/start-bitbucket.sh ${ARGS}"
else
    exec "${BITBUCKET_INSTALL_DIR}/bin/start-bitbucket.sh" ${ARGS}
fi
