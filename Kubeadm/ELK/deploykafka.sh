helm delete elk-kafka -n elk-logger
sleep 1
kubectl delete -f filebeat-kubernetes.yaml
sleep 1
helm delete logstash -n elk-logger
sleep 1
kubectl delete pvc data-elk-kafka-0 -n elk-logger
kubectl delete pvc data-elk-kafka-1 -n elk-logger
kubectl delete pvc data-elk-kafka-2 -n elk-logger
sleep 1
helm repo add rhcharts https://ricardo-aires.github.io/helm-charts/
helm repo update
sleep 2
helm upgrade --install elk-kafka rhcharts/kafka -f kafkavalues.yaml  -n elk-logger
sleep 5
#kubectl apply -f filebeat-kubernetes.yaml
#sleep 5
#helm upgrade --install logstash elastic/logstash --namespace elk-logger -f ./logstash.yaml
