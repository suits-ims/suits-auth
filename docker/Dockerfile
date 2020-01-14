FROM jboss/keycloak:8.0.1
COPY .tools/realm/suits-ims-realm.json /tmp/suits-ims-realm.json
COPY .tools/entrypoint/docker-entrypoint.sh /tmp/docker-entrypoint.sh
ENV KEYCLOAK_IMPORT=/tmp/suits-ims-realm.json
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD ["-b", "0.0.0.0"]