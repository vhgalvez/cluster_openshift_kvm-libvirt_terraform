#cloud-config
hostname: ${hostname}
manage_etc_hosts: true


# Expansión del sistema de archivos y configuración de partición
growpart:
  mode: auto
  devices: ["/"]
  ignore_growroot_disabled: false

resize_rootfs: true

# Configuración de usuario y autenticación
chpasswd:
  list: |
    core:$6$hNh1nwO5OWWct4aZ$OoeAkQ4gKNBnGYK0ECi8saBMbUNeQRMICcOPYEu1bFuj9Axt4Rh6EnGba07xtIsGNt2wP9SsPlz543gfJww11/
  expire: false

ssh_pwauth: true
disable_root: false

users:
  - name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: [adm, wheel]
    lock_passwd: false
    ssh_authorized_keys: ${ssh_keys}



# Configuración de red, utilizando contenido codificado en base64
write_files:
-   encoding: b64
    content: U0VMSU5VWD1kaXNhYmxlZApTRUxJTlVYVFlQRT10YXJnZXRlZCAKIyAK
    owner: root:root
    path: /etc/sysconfig/selinux
    permissions: '0644'


-   encoding: b64
    content: VFlQRT0iRXRoZXJuZXQiClBST1hZX01FVEhPRD0ibm9uZSIKQlJPV1NFUl9PTkxZPSJubyIKQk9PVFBST1RPPSJub25lIgpERUZST1VURT0ieWVzIgpJUFY0X0ZBSUxVUkVfRkFUQUw9Im5vIgpJUFY2SU5JVD0ibm8iCk5BTUU9ImV0aDAiCkRFVklDRT0iZXRoMCIKT05CT09UPSJ5ZXMiCklQQUREUj0iMTkyLjE2OC4wLjI3IgpQUkVGSVg9IjI0IgpHQVRFV0FZPSIxOTIuMTY4LjAuMSIKRE5TMT0iOC44LjguOCIKRE5TMj0iOC44LjQuNCI=
    owner: root:root
    path: /etc/sysconfig/network-scripts/ifcfg-eth0
    permissions: "0644"

-   path: /etc/motd
    content: |
      Managed by Terraform
    owner: root:root
    permissions: "0644"


# Comandos a ejecutar después de la primera carga
runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log
