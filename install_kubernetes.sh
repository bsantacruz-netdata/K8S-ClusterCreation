#!/bin/bash

# Deshabilitar Swap
sudo swapoff -a

# Comentar cualquier entrada de Swap en fstab
sudo sed -i '/ swap / s/^/#/' /etc/fstab

# Añadir llave GPG de Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Añadir repositorio de Kubernetes
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# Actualizar lista de paquetes
sudo apt-get update

# Instalar kubelet, kubeadm y kubectl
sudo apt-get install -y kubelet=1.27.0-00 kubeadm=1.27.0-00 kubectl=1.27.0-00

# Deshabilitar actualizaciones automáticas para ellos
sudo apt-mark hold kubelet kubeadm kubectl
