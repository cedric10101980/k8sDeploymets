#!/usr/bin/bash
 
NAME=$2
NS=elk-logger
CHART=elastic/${NAME}
VALUES=${NAME}/values.yaml
 
display_usage() {
    echo -e "\nThis script must be run with 2 parameters"
    echo -e "\nUsage:\n$0 [install|update] [elasticsearch|kibana|metricbeat]"
    echo -e "\n Example:\n$0 install kibana \n"
    }
 
if [[  $# -le 1 ||  $# == "-h" ]]
then
  display_usage
  exit 1
fi
 
helm repo add elastic https://helm.elastic.co
helm repo update
 
case $1 in
install)
        helm install ${NAME} "${CHART}" --namespace ${NS} -f "${VALUES}"
        #helm install --debug --dry-run --name ${NAME} --namespace ${NS} -f ${NAME}.yaml ${CHART} > ${NAME}-debug.yaml
        ;;
update)
        helm upgrade elk-"${NAME}" "${RELEASE}" "${CHART}" --namespace ${NS} -f "${VALUES}"
        ;;
*)
        display_usage
        ;;
esac