ARGOCD_CR_NAMESPACE=openshift-gitops
ARGOCD_OPERATOR_NAMESPACE=openshift-operators
ARGOCD_TOOLING_NAMESPACE=tooling
oc delete application camelk -n ${ARGOCD_CR_NAMESPACE}
oc delete appproject rhte-camelk-tooling -n ${ARGOCD_CR_NAMESPACE}
oc delete appproject default -n ${ARGOCD_CR_NAMESPACE}
oc delete gitopsservice cluster -n ${ARGOCD_CR_NAMESPACE}
oc delete argocd openshift-gitops -n ${ARGOCD_CR_NAMESPACE}
oc delete csv openshift-gitops-operator.v1.6.3 -n ${ARGOCD_OPERATOR_NAMESPACE}
oc delete subs openshift-gitops-operator -n ${ARGOCD_OPERATOR_NAMESPACE}
oc delete project ${ARGOCD_CR_NAMESPACE}
oc delete project ${ARGOCD_TOOLING_NAMESPACE}