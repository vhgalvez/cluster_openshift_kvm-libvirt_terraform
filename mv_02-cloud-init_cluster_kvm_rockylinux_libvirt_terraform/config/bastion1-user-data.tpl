#cloud-config
growpart:
  mode: auto
  devices: ["/"]
  ignore_growroot_disabled: false

resize_rootfs: noblock

chpasswd:
  expire: false
ssh_pwauth: true
disable_root: false

users:
  - default
  - name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: adm,wheel
    passwd: $6$HE/RBjEb$dQXF27SB4..................
    lock_passwd: false
    ssh_authorized_keys:
      - ${ssh_keys}

timezone: ${timezone}
