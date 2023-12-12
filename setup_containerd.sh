#!/bin/bash

# Crear archivo de configuración para containerd
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# Cargar los módulos
sudo modprobe overlay
sudo modprobe br_netfilter

# Configurar el sistema para la red de Kubernetes
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Aplicar las nuevas configuraciones
sudo sysctl --system

# Instalar containerd
sudo apt-get update && sudo apt-get install -y containerd

# Crear archivo de configuración predeterminado para containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

# Reiniciar containerd
sudo systemctl restart containerd

# Verificar que containerd esté en funcionamiento
sudo systemctl status containerd
