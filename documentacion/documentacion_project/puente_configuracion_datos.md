

```bash
cat /etc/sysconfig/network-scripts/ifcfg-br0
```

```plaintext

# /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
TYPE=Bridge
BOOTPROTO=static
IPADDR=192.168.0.27
PREFIX=24
GATEWAY=192.168.0.1
DNS1=8.8.8.8
DNS2=8.8.4.4
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no
ONBOOT=yes
NM_CONTROLLED=no
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
