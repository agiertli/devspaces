startUser=5
endUser=10

# for i in $(seq $startUser $endUser)
# do
#     oc login --server= -u user$i -p openshift
# done

# login as cluster admin
oc login --token=sha256~a2SA2BE4yqxs6p2racU_DjW3X3oH13jnZsGub3SZbgI --server=https://api.cluster-b6ps8.b6ps8.sandbox2192.opentlc.com:6443

for i in $(seq $startUser $endUser)
do
    oc process -f yaml/namespace.yaml -p USERNAME=user$i | oc create -f - &
    sleep 0.3
    oc adm policy add-role-to-user admin user$i -n user$i-devspaces
    oc process -f yaml/auth.yaml -p USERNAME=user$i -p UUID=$(oc get users.user.openshift.io user$i | awk 'FNR == 2 { print $2 }') | oc create -f - &
done
