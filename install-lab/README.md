## ArgoCD Setup

This dir includes scripts and resources necessary for setting up the ArgoCD 

## Pre-requisite

You are logged into the OpenShift cluster as cluster admin

## Usage

./install.sh -p <ARGOCD_MASTER_PASSWORD>

./install.sh -p argorhte2023

## Output
Openshift GitOps operator will be installed and `rhte-camelk-tooling-app-of-apps` will be created in the default ArgoCD instance which is located in `openshift-gitops` namespace