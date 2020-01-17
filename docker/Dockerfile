FROM jboss/keycloak:8.0.1

COPY .tools/realm/suits-ims-realm.json /suits-ims-realm.json
ENV KEYCLOAK_IMPORT=/suits-ims-realm.json

RUN sed -i '/^exec\ \/opt\/jboss\/keycloak\/bin\/standalone.sh/ s/$/ -Djboss.http.port=$PORT/' /opt/jboss/tools/docker-entrypoint.sh