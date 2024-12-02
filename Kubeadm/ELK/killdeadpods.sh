namespace=$1
 
status=$2
 
delpods=$(kubectl get pods -n ${namespace} | grep -i ${status:='ContainerCreating'} | awk '{print $1 }')
 
for i in ${delpods[@]}; do
  kubectl delete pod $i --force=true --wait=false --grace-period=0  -n ${namespace}
done
