#cloud-config
hostname: ${hostname}
manage_etc_hosts: true

growpart:
  mode: auto
  devices: ["/"]
  ignore_growroot_disabled: false

resize_rootfs: true

chpasswd:
  list: |
    core:${core_password}
    root:${root_password}
  expire: false

ssh_pwauth: true
disable_root: false

users:
  - name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: [adm, wheel]
    lock_passwd: false
    ssh_authorized_keys:
      - ${ssh_keys}

write_files:
  - path: /etc/sysconfig/network-scripts/ifcfg-eth0
    owner: root:root
    permissions: "0644"
    content: |
      TYPE=Ethernet
      DEVICE=eth0
      ONBOOT=yes
      BOOTPROTO=none
      NM_CONTROLLED=yes
      BRIDGE=br0
      IPADDR=192.168.0.27
      PREFIX=24
      GATEWAY=192.168.0.1
      DNS1=8.8.8.8
      DNS2=8.8.4.4
      IPV4_FAILURE_FATAL=no
      IPV6INIT=no

runcmd:
  - [systemctl, restart, NetworkManager]