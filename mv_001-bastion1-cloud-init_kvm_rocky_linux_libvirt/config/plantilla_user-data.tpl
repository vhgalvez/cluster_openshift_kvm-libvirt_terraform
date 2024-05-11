#cloud-config
hostname: ${hostname}
manage_etc_hosts: true

growpart:
  mode: auto
  devices: ["/"]
  ignore_growroot_disabled: false

resize_rootfs: noblock

chpasswd:
  expire: false
  list:
    - name: core
      password: $6$mR6G9JRERv6q8R4u$m7fvml93xhr1TdOfugVx3usP6uegNfnCA2b1iUZCUj1dqEOSIW3YqY8j/hXcvGKIUHHWBVHUsY.2jivQmqirS/

ssh_pwauth: true
disable_root: false

users:
  - name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: [adm, wheel]
    lock_passwd: false
    ssh_authorized_keys: ${ssh_keys}

write_files:
  - content: |
      Managed by Terraform
    path: /etc/motd
    permissions: "0644"
    owner: "root:root"

runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log

timezone: ${timezone}
