NAMESPACE=mynamespace;
kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get -n $NAMESPACE ;
# Then safely delete the namespace