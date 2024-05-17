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
    content: U0VMSU5VWD1kaXNhYmxlZApTRUxJTlVYVFlQRT10YXJnZXRlZCAKIyAK
    owner: root:root
    path: /etc/sysconfig/selinux
    permissions: "0644"

  - encoding: b64
    content: REVWSUNFPWV0aDAKVFlQRT1FdGhlcm5ldApPTkJPT1Q9eWVzCkJPT1RQUk9UTz1ub25lCkJSSURHRT1icjA=
    owner: root:root
    path: /etc/sysconfig/network-scripts/ifcfg-eth0
    permissions: "0644"

  - encoding: b64
    content: REVWSUNFPWJyMApUWVBFPUJyaWRnZQpPTkJPT1Q9eWVzCkJPT1RQUk9UTz1zdGF0aWMKSVBBRERSPTE5Mi4xNjguMC4zNQpQUkVGSVg9MjQKR0FURVdBWT0xOTIuMTY4LjAuMQpETlMxPTguOC44LjgKRE5TMj04LjguNC40CkRFRlJPVVRFPXllcwpJUFY0X0ZBSUxVUkVfRkFUQUw9bm8KSVBWNklOSVQ9bm8=
    owner: root:root
    path: /etc/sysconfig/network-scripts/ifcfg-br0
    permissions: "0644"

runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log
  - ["dnf", "install", "-y", "firewalld"]
  - ["systemctl", "enable", "--now", "firewalld"]
  - ["systemctl", "restart", "NetworkManager.service"]
  - ["firewall-cmd", "--permanent", "--zone=public", "--add-interface=br0"]
  - ["firewall-cmd", "--permanent", "--zone=public", "--add-masquerade"]
  - ["firewall-cmd", "--reload"]