FROM quay.io/keycloak/keycloak:26.6.1 AS builder

ENV KC_DB=dev-file

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.6.1

COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY chatterbox-realm.json /opt/keycloak/data/import/

EXPOSE 10000

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--optimized", "--import-realm", "--http-enabled=true", "--http-host=0.0.0.0", "--http-port=10000", "--hostname=https://chatterbox-keycloak.onrender.com", "--proxy-headers=xforwarded"]