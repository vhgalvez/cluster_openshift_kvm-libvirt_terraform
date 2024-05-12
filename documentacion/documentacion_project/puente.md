Para configurar el adaptador de bridge en el nodo "bastion1" y establecer la conectividad de red en el proyecto utilizando Terraform y libvirt, seguirás un conjunto de pasos que garantizarán que "bastion1" actúe como un puente entre tu red local y las máquinas virtuales internas. Aquí te dejo una guía detallada sobre cómo proceder:

## Paso 1: Configurar el Bridge en el Servidor Host
Antes de configurar Terraform, asegúrate de que tu sistema Linux (en este caso, un servidor que ejecuta Rocky Linux) tenga configurado y habilitado correctamente Open vSwitch o cualquier otro software de bridge. Asumiendo que usas Open vSwitch, los comandos básicos serían:

```bash
sudo ovs-vsctl add-br br0
sudo ip link set dev br0 up
```

Estos comandos crean un bridge llamado br0 y lo activan.

## Paso 2: Asignar IP al Bridge (Opcional)
Si necesitas que el bridge br0 tenga una dirección IP en tu red local (para facilitar el acceso directo, por ejemplo), puedes asignarle una dirección IP estática. Sin embargo, esto puede ser gestionado externamente a Terraform si es necesario para no complicar los scripts de Terraform:

```bash
sudo ip addr add 192.168.0.25/24 dev br0
```



sudo ovs-vsctl del-br br0
sudo systemctl stop openvswitch
sudo systemctl disable openvswitch


sudo systemctl restart network
sudo systemctl restart NetworkManager
sudo systemctl restart NetworkManager
