echo -e "CPU:\t"`nproc`;echo -e "RAM:\t"` awk '/Mem:/ {print $2}' <(free -g)`;

# Get summed limits


res=$(kubectl get pods -o=jsonpath='{.items[*]..resources.limits.memory}' -n solon)
let tot=0
for i in $res
do
   if [[ $i =~ "Gi" ]]; then
      i=$(echo $i | sed 's/[^0-9]*//g')
      tot=$(( tot + i * 1024 ))
   elif [[ $i =~ "Mi" ]]; then
      i=$(echo $i | sed 's/[^0-9]*//g')
      tot=$(( tot + i ))
   fi
done
echo $tot
