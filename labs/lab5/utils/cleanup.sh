DEV_NAMESPACE=userN-dev
PROD_NAMESPACE=userN-prod

kamel reset --namespace=$DEV_NAMESPACE
kamel reset --namespace=$PROD_NAMESPACE

oc delete secret artemis-credentials-secret client-truststore -n $DEV_NAMESPACE
oc delete secret artemis-credentials-secret client-truststore  -n $PROD_NAMESPACE