# Fetch and SUM
for i in `kubectl get ns | grep "prf-icarus"|awk '{print $1}'`;
do echo $i echo -e "TotalCPU:\t"`kubectl get pods -n $i -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[].resources.limits.cpu}{"\n"}{end}'|awk '{SUM+=$2}END{print SUM}'`;echo -e "TotalMemory:\t"`kubectl get pods -n $i -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[].resources.limits.memory}{"\n"}{end}'|awk '{SUM+=$2}END{print SUM}'`
done

# Only Fetch
for i in `kubectl get ns | grep "prf-icarus"|awk '{print $1}'`;
do echo $i echo -e "TotalCPU:\t"`kubectl get pods -n $i -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[].resources.limits.cpu}{"\n"}{end}';echo -e "TotalMemory:\t"`kubectl get pods -n $i -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[].resources.limits.memory}{"\n"}{end}'
done