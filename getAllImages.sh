# Template the charts in the list and find all the docker images the generated objects will require

for chart in "apm-server"  "camunda-platform"  "elasticsearch"  "kafka"  "keycloak"  "kibana"  "redis"  "spring-cloud-dataflow"; do
  helm template $chart ./$chart -f ./$chart/envs/openshift/values.yaml | grep -oE 'image: .+' | awk '{print $2}' | sed 's/"//g'
done

# Get all images/tags used in a cluster

kubectl get pods --all-namespaces -o jsonpath="{..image}" | tr -s '[[:space:]]' '\n' | sort | uniq
