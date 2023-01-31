oc process -f artemis-secret.yaml \
-p USERNAME=<TODO> \
-p PASSWORD=<TODO>! \
-p TRUSTSTORE_PASSWORD=<TODO> \
-p BROKER_URL=<TODO> \
| oc apply -f -

oc create secret generic client-truststore --from-file=client.ts