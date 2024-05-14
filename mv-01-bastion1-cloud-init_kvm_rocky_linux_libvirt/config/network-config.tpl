version: 2
ethernets:
  eth0:
    dhcp4: false
    addresses:
      - 192.168.0.35/24
    gateway4: 192.168.0.1
    nameservers:
      addresses:
        - 8.8.8.8
        - 8.8.4.4