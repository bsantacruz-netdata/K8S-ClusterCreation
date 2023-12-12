#!/bin/bash

# Inicializar el clúster
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=1.27.0

# Configurar kubectl para el usuario cloud_user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Instalar Calico para la red
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

# Verificar los nodos
kubectl get nodes
