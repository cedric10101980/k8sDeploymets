kind create cluster --config kind-Cluster.yaml --name cluster

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.9/config/manifests/metallb-native.yaml

#kubectl wait --namespace metallb-system --for=condition=ready pod  --selector=app=metallb --timeout=90s

#kubectl apply -f metallb-conf.yaml

kubectl create namespace kafka

kubectl apply -f  https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

kubectl config set-context --current --namespace=kafka

#kubectl apply -f https://raw.githubusercontent.com/nginx/kubernetes-ingress/v4.0.1/deploy/crds.yaml

