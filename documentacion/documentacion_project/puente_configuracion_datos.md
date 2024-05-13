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





[victory@server ~]$ ifconfig
br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.31  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::7666:f262:9084:9f5f  prefixlen 64  scopeid 0x20<link>
        ether 2c:76:8a:ac:de:bc  txqueuelen 1000  (Ethernet)
        RX packets 1699  bytes 125239 (122.3 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 105  bytes 12666 (12.3 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp3s0f0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 2c:76:8a:ac:de:bc  txqueuelen 1000  (Ethernet)
        RX packets 2716  bytes 252866 (246.9 KiB)
        RX errors 0  dropped 3  overruns 0  frame 0
        TX packets 1498  bytes 107914 (105.3 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp3s0f1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.32  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::2e76:8aff:feac:debe  prefixlen 64  scopeid 0x20<link>
        ether 2c:76:8a:ac:de:be  txqueuelen 1000  (Ethernet)
        RX packets 2310  bytes 183896 (179.5 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 42  bytes 5402 (5.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp4s0f0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.20  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::2e76:8aff:feac:dec0  prefixlen 64  scopeid 0x20<link>
        ether 2c:76:8a:ac:de:c0  txqueuelen 1000  (Ethernet)
        RX packets 2799  bytes 289451 (282.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1467  bytes 248829 (242.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp4s0f1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.18  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::2e76:8aff:feac:dec2  prefixlen 64  scopeid 0x20<link>
        ether 2c:76:8a:ac:de:c2  txqueuelen 1000  (Ethernet)
        RX packets 1211  bytes 113310 (110.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 42  bytes 5402 (5.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

k8s: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.120.1  netmask 255.255.255.0  broadcast 192.168.120.255
        ether 52:54:00:41:a0:5d  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 43  bytes 7108 (6.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 43  bytes 7108 (6.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:be:f6:d5  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vnet0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::fc54:ff:fed2:c915  prefixlen 64  scopeid 0x20<link>
        ether fe:54:00:d2:c9:15  txqueuelen 1000  (Ethernet)
        RX packets 308  bytes 23300 (22.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2236  bytes 160599 (156.8 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

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
 /etc/sysconfig/network-scripts/ifcfg-eth0

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
