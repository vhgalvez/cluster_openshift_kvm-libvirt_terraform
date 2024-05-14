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
    core:$6$hNh1nwO5OWWct4aZ$OoeAkQ4gKNBnGYK0ECi8saBMbUNeQRMICcOPYEu1bFuj9Axt4Rh6EnGba07xtIsGNt2wP9SsPlz543gfJww11/
    root:$6$hNh1nwO5OWWct4aZ$OoeAkQ4gKNBnGYK0ECi8saBMbUNeQRMICcOPYEu1bFuj9Axt4Rh6EnGba07xtIsGNt2wP9SsPlz543gfJww11/

  expire: false

ssh_pwauth: true
disable_root: false

users:
  - default
  - name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: [adm, wheel]
    lock_passwd: false
    ssh_authorized_keys: ${ssh_keys}

  - name: root
    ssh_authorized_keys: ${ssh_keys}

write_files:
  - encoding: b64
    content: VFlQRT1FdGhlcm5ldApERVZJQ0U9ZXRoMApPTkJPT1Q9bm9uZQpCUklER0U9YnIwCk5NX0NPTlRST0xMRUQ9bm9uCklQQUREUj0xOTIuMTY4LjAuMzUKUFJFRklYPTE0CkdBVEVXQVk9MTkyLjE2OC4wLjEKRE5TMT04LjguOC44CkROUzI9OC44LjQuNApJUFY0X0ZBSUxVUkVfRkFUQUw9bm8KSVBWNklOSVQ9bm8KREVGT1VURT0ieWVzIgpCUk9XU0VSX09OTFk9Im5vIgpQUk9YWV9NRVRIT0Q9Im5vbmUi
    owner: root:root
    path: /etc/sysconfig/network-scripts/ifcfg-eth0
    permissions: "0644"

runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log
  - ["systemctl", "restart", "NetworkManager.service"]
