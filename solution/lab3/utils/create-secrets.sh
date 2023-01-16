
oc process -f artemis-secret.yaml \
-p USERNAME=admin \
-p PASSWORD=password1! \
-p TRUSTSTORE_PASSWORD=password1! \
-p BROKER_URL=amqps://rhte-artemis-one-way-ssl-0-svc.tooling.svc.cluster.local:5673 \
| oc apply -f -