## How to use this repository

### Prereqs
 - You are logged into OpenShift Cluster as a cluster admin

### Usage
```bash
cd install-lab && ./install.sh -p arbitrary-argocd-master-password
```

### Sumamry
That's about it! The above command install OpenShift GitOps operator which install Dev Spaces + Namespace Config Operator + Kubernetes Image Puller. The whole process takes around 15 mins.
