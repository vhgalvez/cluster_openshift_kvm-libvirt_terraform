# Configuracion de puente de red en Rocky Linux 9 con NetworkManager KVM y libvirt cloud init 

quiero que la maquina virtual tenga una configuracion de red estatica y que se conecte a la red a traves de un puente de red.
con la ip 192.168.0.35 y que tenga acceso a internet. y salidas a internet.

# Hardware del Servidor

- **Modelo**: ProLiant DL380 G7
- **CPU**: Intel Xeon X5650 (24 cores) @ 2.666GHz
- **GPU**: AMD ATI 01:03.0 ES1000
- **Memoria**: 1093MiB / 35904MiB
- **Almacenamiento**:
  - Disco Duro Principal: 1.5TB
  - Disco Duro Secundario: 3.0TB

## Sistemas Operativos y Virtualización

- **Rocky Linux 9.3 (Blue Onyx)**
- **rocky linux minimal**
- **KVM con Libvirt**: kvm/qemu y libvirt y Virt-Manager
- **Flatcar Container Linux**

### Especificaciones de Almacenamiento y Memoria

- **Configuración de Disco y Particiones**:
  - **/dev/sda**: 3.27 TiB
  - **/dev/sdb**: 465.71 GiB
- **Particiones**:
  - **/dev/sda1**: Sistema
  - **/dev/sda2**: 2 GB Linux Filesystem
  - **/dev/sda3**: ~2.89 TiB Linux Filesystem
- **Uso de Memoria**:
  - **Total Memory**: 35GiB
  - **Free Memory**: 33GiB
  - **Swap**: 17GiB
- **Uso del Filesystem**:
  - **/dev/mapper/rl-root**: 100G (7.5G usado)
  - **/dev/sda2**: 1014M (718M usado)
  - **/dev/mapper/rl-home**: 3.0T (25G usado)
  

### Interfaces de Red Identificadas

ips ejemplo dhscp de las interfaces de red en el servidor fisico

- **enp3s0f0**: 192.168.0.15 +
- **enp3s0f1**: 192.168.0.16  (utilizada para Bridge en Bastion Node)
- **enp4s0f0**: 192.168.0.20 
- **enp4s0f1**: 192.168.0.18 
- **lo (Loopback)**: 127.0.0.1


- **configuracion de red en Rocky Linux 9 servidor fisico con NetworkManager KVM y libvirt cloud init**

```bash
cat /etc/sysconfig/network-scripts/ifcfg-br0
```

```plaintext
# /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
TYPE=Bridge
BOOTPROTO=static
IPADDR=192.168.0.35
PREFIX=24
GATEWAY=192.168.0.1
DNS1=8.8.8.8
DNS2=8.8.4.4
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no
ONBOOT=yes
NM_CONTROLLED=yes
DELAY=0
```

```bash
cat /etc/sysconfig/network-scripts/ifcfg-enp3s0f0
```

```plaintext
# /etc/sysconfig/network-scripts/ifcfg-enp3s0f0
DEVICE=enp3s0f0
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes
BRIDGE=br0
```

```bash
cat /etc/NetworkManager/conf.d/br0.conf
```

```plaintext
[device]
match-device=br0
```

```bash
cat /etc/NetworkManager/10-globally-managed-devices.conf
```

```plaintext
[keyfile]
unmanaged-devices=none
```

```bash
cat /etc/NetworkManager/NetworkManager.conf
```

```plaintext
[main]
plugins=keyfile,ifcfg-rh
```

```plaintext
    [logging]
level=DEBUG
domains=ALL
```

```bash
    sudo systemctl restart NetworkManager
```


# Maquina Virtual configuracion red  cloud init

\config\bastion1-user-data.tpl

base64
configuracion red cloud init maquina virtual en el archivo de configuracion de cloud init

 cat /etc/sysconfig/network-scripts/ifcfg-eth0

 \config\bastion1-user-data.tpl

```yaml
TYPE=Ethernet
DEVICE=eth0
ONBOOT=yes
BOOTPROTO=none
BRIDGE=br0
NM_CONTROLLED=yes
IPADDR=192.168.0.35
PREFIX=24
GATEWAY=192.168.0.1
DNS1=8.8.8.8
DNS2=8.8.4.4
IPV4_FAILURE_FATAL=no
IPV6INIT=no
DEFROUTE="yes"
BROWSER_ONLY="no"
PROXY_METHOD="none"
```

base64
 \config\bastion1-user-data.tpl

```yaml
 - encoding: b64
    content: VFlQRT1FdGhlcm5ldApERVZJQ0U9ZXRoMApPTkJPT1Q9eWVzCkJPT1RQUk9UTz1ub25lCkJSSURHRT1icjAKTk1fQ09OVFJPTExFRD1ubwpJUEFERFI9MTkyLjE2OC4wLjM1ClBSRUZJWD0yNApHQVRFV0FZPTE5Mi4xNjguMC4xCkROUzE9OC44LjguOApETlMyPTguOC40LjQKSVBWNF9GQUlMVVJFX0ZBVEFMPW5vCklQVjZJTklUPW5vCkRFRlJPVVRFPSJ5ZXMiCkJST1dTRVJfT05MWT0ibm8iClBST1hZX01FVEhPRD0ibm9uZSI=
    owner: root:root
    path: /etc/sysconfig/network-scripts/ifcfg-eth0
    permissions: "0644"
```

# Main.tf

# ip fija 192.168.0.35

resource "libvirt_network" "kube_network_01" {
  name      = var.rocky9_network_name
  mode      = "bridge"
  bridge    = "br0"
  autostart = true
  addresses = ["192.168.0.0/24"]
}


data "template_file" "vm_configs" {
  for_each = var.vm_rockylinux_definitions

  template = file("${path.module}/config/${each.key}-user-data.tpl")
  vars = {
    ssh_keys = jsonencode(var.ssh_keys)
    hostname = each.value.hostname
    timezone = var.timezone
    ipaddr   = each.value.ip
    gateway  = "192.168.0.1"
    dns1     = "8.8.8.8"
    dns2     = "8.8.4.4"
  }
}


sudo virsh net-list --all
 Nombre            Estado   Inicio automático   Persistente
-------------------------------------------------------------
 default           activo   si                  si
 k8s-network       activo   si                  si
 kube_network_01   activo   si                  si

sudo virsh net-dhcp-leases  kube_network_01


tree

├── config
│   ├── bastion1-user-data.tpl
│   └── network-config.tpl
├── main.tf
├── terraform.tfvars
└── vars.tf



sudo nmcli con show br0
sudo virsh net-list --all
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all
sudo virsh list --all
sudo nmcli con mod br0 ipv4.addresses "192.168.0.35/24" ipv4.gateway "192.168.0.1" ipv4.dns "8.8.8.8,8.8.4.4"
sudo nmcli con up br0
 mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$ sudo nmcli con mod br0 ipv4.addresses "192.168.0.35/24" ipv4.gateway "192.168.0.1" ipv4.dns "8.8.8.8,8.8.4.4"
 mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$ sudo nmcli con up br0
La conexión se ha activado correctamente (master waiting for slaves) (ruta activa D-Bus: /org/freedesktop/NetworkManager/ActiveConnection/10)
 mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$


sudo nmcli connection up br0
sudo brctl addif br0 enp3s0f0
sudo systemctl restart NetworkManager
sudo systemctl restart NetworkManager
sudo systemctl restart libvirtd
sudo systemctl restart NetworkManager
ip addr show br0
sudo brctl addif br0 enp3s0f0
sudo systemctl restart NetworkManager
sudo systemctl restart libvirtd
journalctl -u NetworkManager
journalctl -u libvirtd
ip addr show eth0
ping -c 4 google.com
sudo nmcli con mod br0 ipv4.addresses "192.168.0.35/24"
sudo nmcli con mod br0 ipv4.gateway "192.168.0.1"
sudo nmcli con mod br0 ipv4.dns "8.8.8.8,8.8.4.4"
sudo nmcli con mod br0 ipv4.method manual
sudo systemctl restart NetworkManager