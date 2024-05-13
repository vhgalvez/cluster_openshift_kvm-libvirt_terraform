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

# Configuración de red, utilizando contenido codificado en base64

write_files:
  - encoding: b64
    content: U0VMSU5VWD1kaXNhYmxlZApTRUxJTlVYVFlQRT10YXJnZXRlZCAKIyAK
    owner: root:root
    path: /etc/sysconfig/selinux
    permissions: "0644"

  - encoding: b64
    content: VFlQRT1FdGhlcm5ldApERVZJQ0U9ZXRoMApPTkJPT1Q9eWVzCkJPT1RQUk9UTz1ub25lCk5NX0NPTlRST0xMRUQ9eWVzCkJSSURHRT1icjAKSVBBRERSPTE5Mi4xNjguMC4yNwpQUkVGSVg9MjQKR0FURVdBWT0xOTIuMTY4LjAuMQpETlMxPTguOC44LjgKRE5TMj04LjguNC40CklQVjRfRkFJTFVSRV9GQVRBTD1ubwpJUFY2SU5JVD1ubw==
    owner: root:root
    path: /etc/sysconfig/network-scripts/ifcfg-eth0
    permissions: "0644"

# Comandos a ejecutar después de la primera carga
runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log
  - ["systemctl", "restart", "NetworkManager.service"]
