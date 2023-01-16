PROD=user1-prod
DEV=user1-dev
DESTINATION=group1

echo "Creating Custom JMS AMQP Sink Kamelet in $DEV"
oc apply -f custom-jms-amqp-sink.yaml -n $DEV

echo "Creating Custom JMS AMQP Sink Kamelet in $PROD"
oc apply -f custom-jms-amqp-sink.yaml -n $PROD

echo "creating dev artemis configuration in $DEV"
oc process -f artemis-cm.yaml \
-p DESTINATION_TYPE=topic \
-p DESTINATION=$DESTINATION-dev  \
-p ROUTE_ID=dev \
| oc apply -f - -n $DEV

echo "creating prod artemis configuration in $PROD"
oc process -f artemis-cm.yaml \
-p DESTINATION_TYPE=topic \
-p DESTINATION=$DESTINATION-prod  \
-p ROUTE_ID=prod \
| oc apply -f - -n $PROD

echo "Creating artemis credentials secret in $DEV"
oc process -f artemis-secret.yaml \
-p USERNAME=admin \
-p PASSWORD=password1! \
-p TRUSTSTORE_PASSWORD=password1! \
-p BROKER_URL=amqps://rhte-artemis-one-way-ssl-0-svc.tooling.svc.cluster.local:5673 \
-p TRUSTSTORE_LOCATION=/etc/ssl/jms-sink/client.ts \
| oc apply -f - -n $DEV
echo "Creating artemis credentials secret in $PROD"

oc process -f artemis-secret.yaml \
-p USERNAME=admin \
-p PASSWORD=password1! \
-p TRUSTSTORE_PASSWORD=password1! \
-p BROKER_URL=amqps://rhte-artemis-one-way-ssl-0-svc.tooling.svc.cluster.local:5673 \
-p TRUSTSTORE_LOCATION=/etc/ssl/jms-sink/client.ts \
| oc apply -f - -n $PROD

echo "Creating Integration Platform in $DEV"
oc apply -f ip.yaml -n $DEV
echo "Creating Integration Platform in $PROD"
oc apply -f ip.yaml -n $PROD

echo "Creating artemis truststore secret in $DEV"
oc create secret generic client-truststore --from-file=client.ts -n $DEV
echo "Creating artemis truststore secret in $PROD"
oc create secret generic client-truststore --from-file=client.ts -n $PROD