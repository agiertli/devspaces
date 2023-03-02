startUser=5
endUser=10

for i in $(seq $startUser $endUser)
do
#     # Config Maps to Be Installeed
#     oc process -f yaml/devworkspace-gitconfig.yaml -p USERNAME=user$i | oc create -f - -n user$i-devspaces

#     # Add missing secrets
#     oc process -f yaml/user-preferences.yaml -p USERNAME=user$i | oc create -f - -n user$i-devspaces
#     oc process -f yaml/user-profile.yaml -p USERNAME=user$i | oc create -f - -n user$i-devspaces

    # Create the workspace
    oc process -f yaml/devworkspace.yaml -p USERNAME=user$i | oc create -f - -n user$i-devspaces &
    
done
