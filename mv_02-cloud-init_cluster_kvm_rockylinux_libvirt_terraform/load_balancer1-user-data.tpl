#cloud-config
growpart:
  mode: auto
  devices: ["/"]
  ignore_growroot_disabled: false

resize_rootfs: noblock

users:
  - name: default
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: sudo
    shell: /bin/bash
  - name: core
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: users, admin
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_keys}

timezone: "Europe/London"
