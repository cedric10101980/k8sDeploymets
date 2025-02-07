helm uninstall kibana

kubectl delete configmap kibana-kibana-helm-scripts -n elk-logger
kubectl delete serviceaccount pre-install-kibana-kibana -n elk-logger
kubectl delete serviceaccount post-install-kibana-kibana -n elk-logger
kubectl delete role pre-install-kibana-kibana -n elk-logger
kubectl delete role post-delete-kibana-kibana -n elk-logger
kubectl delete rolebinding pre-install-kibana-kibana -n elk-logger
kubectl delete job pre-install-kibana-kibana -n elk-logger
kubectl delete secret kibana-kibana-es-token -n elk-logger

./elk-setup.sh install kibana
