


# Configuracion de puente de red en Rocky Linux 9 con NetworkManager KVM y libvirt cloud init 

quiero que la maquina virtual tenga una configuracion de red estatica y que se conecte a la red a traves de un puente de red.
con la ip 192.168.0.35 y que tenga acceso a internet. y salidas a internet.


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


```bash
cat /etc/NetworkManager/NetworkManager.conf
```

```plaintext
[main]
plugins=keyfile,ifcfg-rh

```
    
    [logging]
level=DEBUG
domains=ALL

    ```bash
    sudo systemctl restart NetworkManager
    ```




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

main.tf
# ip fija 192.168.0.35
resource "libvirt_network" "kube_network_01" {
  name      = "kube_network_01"
  mode      = "bridge"
  bridge    = "br0"
  autostart = "true"
}


[victory@server ~]$ neofetch
        #####           victory@server.cefas.com
       #######          ------------------------
       ##O#O##          OS: Rocky Linux 9.4 (Blue Onyx) x86_64
       #######          Host: ProLiant DL380 G7
     ###########        Kernel: 5.14.0-427.16.1.el9_4.x86_64
    #############       Uptime: 42 mins
   ###############      Packages: 1276 (rpm)
   ################     Shell: bash 5.1.8
  #################     Resolution: 1024x768
#####################   Terminal: /dev/pts/0
#####################   CPU: Intel Xeon X5650 (24) @ 2.665GHz
  #################     GPU: AMD ATI 01:03.0 ES1000
                        Memory: 2042MiB / 35904MiB



[victory@server ~]$ sudo virsh net-list --all
 Nombre            Estado   Inicio automático   Persistente
-------------------------------------------------------------
 default           activo   si                  si
 k8s-network       activo   si                  si
 kube_network_01   activo   si                  si

[victory@server ~]$ sudo virsh net-dhcp-leases  kube_network_01
 Expiry Time   dirección MAC   Protocol   IP address   Hostname   Client ID or DUID
-------------------------------------------------------------------------------------

[victory@server ~]$


sudo nmcli con show br0


sudo virsh net-list --all
sudo virsh net-start default
sudo virsh net-autostart default



sudo virsh list --all


sudo nmcli con mod br0 ipv4.addresses "192.168.0.35/24" ipv4.gateway "192.168.0.1" ipv4.dns "8.8.8.8,8.8.4.4"
sudo nmcli con up br0


[victory@server mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$ sudo nmcli con mod br0 ipv4.addresses "192.168.0.35/24" ipv4.gateway "192.168.0.1" ipv4.dns "8.8.8.8,8.8.4.4"
[victory@server mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$ sudo nmcli con up br0
La conexión se ha activado correctamente (master waiting for slaves) (ruta activa D-Bus: /org/freedesktop/NetworkManager/ActiveConnection/10)
[victory@server mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$


[victory@server mv-01-bastion1-cloud-init_kvm_rocky_linux_libvirt]$ tree

├── config
│   ├── bastion1-user-data.tpl
│   └── cloud-init.log
├── main.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
└── vars.tf
