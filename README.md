# Scripts de Configuración de Clúster Kubernetes

Este repositorio contiene los Bash Scripts necesarios para configurar un clúster de Kubernetes en su versión 1.27, ideal para la automatización y gestión de aplicaciones en contenedores.

## Scripts

1. `setup_containerd.sh`: Configura Containerd con ajustes de kernel y red para Kubernetes en cada servidor.
2. `install_kubernetes.sh`: Prepara el sistema para Kubernetes, instala componentes clave y previene actualizaciones automáticas en cada servidor.
3. `init_cluster.sh`: Inicializa un clúster Kubernetes, configura `kubectl`, instala Calico y verifica los nodos.

## Uso

Ejecuta los siguientes pasos en el CONTROL PLANE y en cada WORKER NODE:

1. Ejecuta la siguiente secuencia de comandos para la ejecución del archivo setup_containerd.sh
   
   `wget https://raw.githubusercontent.com/juanmarin-netdata/Creando-un-cluster-de-Kubernetes/main/setup_containerd.sh`
   
   `chmod +x setup_containerd.sh`
   
   `./setup_containerd.sh`
   
2. Ejecuta la siguiente secuencia de comandos para la ejecución del archivo setup_containerd.sh
   
   `wget https://raw.githubusercontent.com/juanmarin-netdata/Creando-un-cluster-de-Kubernetes/main/install_kubernetes.sh`
   
   `chmod +x install_kubernetes.sh`
   
   `./install_kubernetes.sh`

Ejecuta los siguientes pasos en el CONTROL PLANE

1. Ejecuta la siguiente secuencia de comandos para la ejecución del archivo init_cluster.sh
   
   `wget https://raw.githubusercontent.com/juanmarin-netdata/Creando-un-cluster-de-Kubernetes/main/init_cluster.sh`
   
   `chmod +x init_cluster.sh`
   
   `./init_cluster.sh`

2. Crea el token de autenticación para la vinculación de worker nodes y copia la respuesta 

   `kubeadm token create --print-join-command`

Vincula cada worker node al plano de control ejecutando el siguiente comando, sustituyendo con los valores guaradados previamente:

   `sudo kubeadm join ... --token ... --discovery-token-ca-cert-hash sha256:...`

## Prerrequisitos

- **Sistema Operativo**: Linux.
- **Conocimientos**: Administración de sistemas Linux y contenedores.
- **Herramientas**: `curl`, `sudo`, terminal.
- **Red**: Conexión a internet.
- **Permisos**: Privilegios de superusuario o `sudo`.
- **Hardware**: Al menos dos servidores, uno para el Control Plane y otro como Worker Node.

## Notas Adicionales

- **Kubernetes**: Orquestador de contenedores para la administración de aplicaciones.
- **Containerd**: Plataforma de ejecución de contenedores.

Consulta los comentarios en cada script para más detalles.
