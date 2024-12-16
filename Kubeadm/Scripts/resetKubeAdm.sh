#!/bin/bash
 
set -exu

kubeadm reset --cri-socket=unix:///var/run/crio/crio.sock
 
# Stop Services
systemctl stop kubelet docker
 
# Backup Kubernetes and kubelet
rm -rf /etc/kubernetes-backup/kubernetes
rm -rf /var/lib/kubelet-backup
 
mv -f /etc/kubernetes /etc/kubernetes-backup || true
mv -f /var/lib/kubelet /var/lib/kubelet-backup || true
 
# Keep the certs we need
mkdir -p /etc/kubernetes
cp -r /etc/kubernetes-backup/pki /etc/kubernetes
rm -rf /etc/kubernetes/pki/{apiserver.*,etcd/peer.*}
 
docker stop $(docker ps -a -q)
 
# Start docker
systemctl start docker
 
# Get current public ip address
IPADDR=$(hostname -I | awk '{print $1}' | cut -d/ -f1)
NODENAME=$(hostname -s)
POD_CIDR="192.168.0.0/16"
 
sudo kill -9 $(sudo lsof -t -i:6443) || true
sudo kill -9 $(sudo lsof -t -i:10259) || true
sudo kill -9 $(sudo lsof -t -i:10257) || true
sudo kill -9 $(sudo lsof -t -i:2379) || true
sudo kill -9 $(sudo lsof -t -i:2380) || true
 
# Init cluster with new ip address
sudo kubeadm init --apiserver-advertise-address=$IPADDR  --apiserver-cert-extra-sans=$IPADDR  --pod-network-cidr=$POD_CIDR --node-name=$NODENAME --cri-socket=unix:///var/run/crio/crio.sock
 
mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl config set-context --current --namespace=default
 
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
 
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
 
# Verify resutl
kubectl cluster-info