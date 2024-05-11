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
      password: $6$VBf88gKc12YFQzXW$orMw/I3ZRDqowbfG/GJ9yeuKNxAM/g1cjd8.Ay6eJ7iRgRZCnSQCCoLUo4zDEowjn2ioMtr/I.9dc9l3sP2UV0

ssh_pwauth: true
disable_root: false

users:
  - name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: adm, wheel
    lock_passwd: false
    ssh_authorized_keys: ${ssh_keys}

write_files:
  - content: |
      Managed by Terraform
    path: /etc/motd
    permissions: "0644"
    owner: root:root

runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log

timezone: ${timezone}
