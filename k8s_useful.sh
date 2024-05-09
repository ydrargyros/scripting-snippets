# Namespace stuck Terminating
kubectl get namespace "swpd-awx" -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/swpd-awx/finalize -f -

