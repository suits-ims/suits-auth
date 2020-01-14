#!/bin/bash

sed -i '/^exec\ \/opt\/jboss\/keycloak\/bin\/standalone.sh.*/i SYS_PROPS+=" -Djboss.http.port=$PORT"' /opt/jboss/tools/docker-entrypoint.sh
exec /opt/jboss/tools/docker-entrypoint.sh
exit $?