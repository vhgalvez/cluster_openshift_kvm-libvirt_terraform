# Instalar Open vSwitch si aún no está instalado
sudo dnf install openvswitch

# Iniciar el servicio Open vSwitch
sudo systemctl start openvswitch
sudo systemctl enable openvswitch

# Crear un puente OVS
sudo ovs-vsctl add-br br0

# Asignar una dirección IP al puente, si aún no está configurada
sudo ip addr add 192.168.0.25/24 dev br0
sudo ip link set dev br0 up