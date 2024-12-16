#!/bin/bash
 
set -exu

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

kubectl -n kube-system create serviceaccount admin
 

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: admin-secret
  namespace: kube-system
  annotations:
    kubernetes.io/service-account.name: admin
type: kubernetes.io/service-account-token
EOF
 

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: admin-secret
  namespace: kube-system
  annotations:
    kubernetes.io/service-account.name: admin
type: kubernetes.io/service-account-token
EOF
 

cat << EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: admin
rules:
- apiGroups: [""]
  resources:
  - services
  - endpoints
  - pods
  - namespaces
  - pods/log
  - pods/status
  - pods/var
  verbs: ["get", "list", "watch"]   
- apiGroups:
  - extensions
  resources:
  - ingresses
  verbs: ["get", "list", "watch"]
EOF
 

cat << EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: admin
subjects:
- kind: ServiceAccount
  name: admin
  namespace: kube-system
EOF
 

export SA_SECRET_TOKEN=$(kubectl -n kube-system get secret/admin-secret -o=go-template='{{.data.token}}' | base64 --decode)
 
export CLUSTER_NAME=$(kubectl config current-context)
 
export CURRENT_CLUSTER=$(kubectl config view --raw -o=go-template='{{range .contexts}}{{if eq .name "'''${CLUSTER_NAME}'''"}}{{ index .context "cluster" }}{{end}}{{end}}')
 
export CLUSTER_CA_CERT=$(kubectl config view --raw -o=go-template='{{range .clusters}}{{if eq .name "'''${CURRENT_CLUSTER}'''"}}"{{with index .cluster "certificate-authority-data" }}{{.}}{{end}}"{{ end }}{{ end }}')
 
export CLUSTER_ENDPOINT=$(kubectl config view --raw -o=go-template='{{range .clusters}}{{if eq .name "'''${CURRENT_CLUSTER}'''"}}{{ .cluster.server }}{{end}}{{ end }}')
 

cat << EOF > admin-config
apiVersion: v1
kind: Config
current-context: ${CLUSTER_NAME}
contexts:
- name: ${CLUSTER_NAME}
  context:
    cluster: ${CLUSTER_NAME}
    user: admin
clusters:
- name: ${CLUSTER_NAME}
  cluster:
    certificate-authority-data: ${CLUSTER_CA_CERT}
    server: ${CLUSTER_ENDPOINT}
users:
- name: admin
  user:
    token: ${SA_SECRET_TOKEN}
EOF
