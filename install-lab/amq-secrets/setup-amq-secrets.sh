
export BROKER_KEYSTORE_PASSWORD=password1!

keytool -genkey -alias broker -keyalg RSA -keystore broker.ks -storepass $BROKER_KEYSTORE_PASSWORD -keypass $BROKER_KEYSTORE_PASSWORD -dname "CN=Anton, O=RedHat, C=UK"
keytool -storepass $BROKER_KEYSTORE_PASSWORD -export -alias broker -keystore broker.ks -file broker_cert.pem
keytool -storepass $BROKER_KEYSTORE_PASSWORD -import -alias broker -keystore client.ts -file broker_cert.pem -trustcacerts -noprompt

oc create secret generic my-tls-secret \
--from-file=broker.ks=broker.ks \
--from-file=client.ts=client.ts \
--from-literal=keyStorePassword=$BROKER_KEYSTORE_PASSWORD \
--from-literal=trustStorePassword=$BROKER_KEYSTORE_PASSWORD --dry-run=client -o yaml > amq-secret.yaml

#oc secrets link sa/amq-broker-operator secret/my-tls-secret