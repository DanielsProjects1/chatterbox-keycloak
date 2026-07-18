FROM quay.io/keycloak/keycloak:26.3.5

COPY chatterbox-realm.json /opt/keycloak/data/import/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--import-realm", "--http-enabled=true", "--hostname-strict=false", "--proxy-headers=xforwarded"]