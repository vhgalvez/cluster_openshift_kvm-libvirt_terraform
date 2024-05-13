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
-   default
-   name: core
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: [adm, wheel]
    lock_passwd: false
    ssh_authorized_keys: ${ssh_keys}

-   name: root
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

  - encoding: b64
    content: R1JVQl9USU1FT1VUPTUKR1JVQl9ESVNUUklCVVRPUj0iJChzZWQgJ3MsIHJlbGVhc2UgLiokLCxnJyAvZXRjL3N5c3RlbS1yZWxlYXNlKSIKR1JVQl9ERUZBVUxUPXNhdmVkCkdSVUJfRElTQUJMRV9TVUJNRU5VPWZhbHNlCkdSVUJfVEVSTUlOQUw9ImNvbnNvbGUiCiNHUlVCX1RFUk1JTkFMPSJjb25zb2xlIHNlcmlhbCIKR1JVQl9TRVJJQUxfQ09NTUFORD0ic2VyaWFsIC0tc3BlZWQ9MTE1MjAwIgojR1JVQl9DTURMSU5FX0xJTlVYPSJpcHY2LmRpc2FibGU9MSBjb25zb2xlPXR0eTEgZWFybHlwcmludGs9dHR5UzAgY3Jhc2hrZXJuZWw9YXV0byBjb25zb2xlPXR0eVMwLDExNTIwMCIKR1JVQl9DTURMSU5FX0xJTlVYPSJpcHY2LmRpc2FibGU9MSBjb25zb2xlPXR0eTAgY3Jhc2hrZXJuZWw9YXV0byIKR1JVQl9ESVNBQkxFX1JFQ09WRVJZPSJmYWxzZSIKCg==
    owner: root:root
    path: /etc/default/grub
    permissions: "0644"

  - encoding: b64
    content: IyEvYmluL2Jhc2gKdG91Y2ggL3Zhci9sb2NrL3N1YnN5cy9sb2NhbAppZiBbWyAtZiAvZXRjL3JjLmxvY2FsLnJlYm9vdG9uY2UgXV0gCnRoZW4KICAgYmFzaCAvZXRjL3JjLmxvY2FsLnJlYm9vdG9uY2UKZmkK
    owner: root:root
    path: /etc/rc.d/rc.local
    permissions: "0755"

  - encoding: b64
    content: Cm5ldC5pcHY2LmNvbmYuYWxsLmRpc2FibGVfaXB2NiA9IDEKbmV0LmlwdjYuY29uZi5kZWZhdWx0LmRpc2FibGVfaXB2NiA9IDEK
    owner: root:root
    path: /etc/sysctl.conf
    permissions: "0644"

  - encoding: b64
    content: TXkgSVAgYWRkcmVzczogXDR7ZXRoMH0gIFxuIFxsCgo=
    owner: root:root
    path: /etc/issue.net
    permissions: "0644"

  - encoding: b64
    content: TXkgSVAgYWRkcmVzczogXDR7ZXRoMH0gIFxuIFxsCgo=
    owner: root:root
    path: /etc/issue
    permissions: "0644"

  - encoding: b64
    content: IyEvYmluL2Jhc2gKZWNobyAiUmVib290aW5nIGZvciBTZWxpbnV4IG9ubHkgb25jZSIKcm0gLWYgIC9ldGMvcmMubG9jYWwucmVib290b25jZQpncnViMi1ta2NvbmZpZyAtbyAvYm9vdC9ncnViMi9ncnViLmNmZwp5dW0gLXkgdXBncmFkZSAKcm0gLWYgL2V0Yy9zc2gvc3NoX2hvc3RfKgojIGh0dHBzOi8vd3d3LnNzaC1hdWRpdC5jb20vaGFyZGVuaW5nX2d1aWRlcy5odG1sI3JoZWw4CnNzaC1rZXlnZW4gLXQgcnNhIC1iIDQwOTYgLWYgL2V0Yy9zc2gvc3NoX2hvc3RfcnNhX2tleSAtTiAiIgpzc2gta2V5Z2VuIC10IGVkMjU1MTkgLWYgL2V0Yy9zc2gvc3NoX2hvc3RfZWQyNTUxOV9rZXkgLU4gIiIKY2hncnAgc3NoX2tleXMgL2V0Yy9zc2gvc3NoX2hvc3RfZWQyNTUxOV9rZXkgL2V0Yy9zc2gvc3NoX2hvc3RfcnNhX2tleQpjaG1vZCBnK3IgL2V0Yy9zc2gvc3NoX2hvc3RfZWQyNTUxOV9rZXkgL2V0Yy9zc2gvc3NoX2hvc3RfcnNhX2tleQphd2sgJyQ1ID49IDMwNzEnIC9ldGMvc3NoL21vZHVsaSA+IC9ldGMvc3NoL21vZHVsaS5zYWZlCm12IC1mIC9ldGMvc3NoL21vZHVsaS5zYWZlIC9ldGMvc3NoL21vZHVsaQpzZWQgLWkgJ3MvXkhvc3RLZXkgXC9ldGNcL3NzaFwvc3NoX2hvc3RfZWNkc2Ffa2V5JC9cI0hvc3RLZXkgXC9ldGNcL3NzaFwvc3NoX2hvc3RfZWNkc2Ffa2V5L2cnIC9ldGMvc3NoL3NzaGRfY29uZmlnCmNwIC9ldGMvY3J5cHRvLXBvbGljaWVzL2JhY2stZW5kcy9vcGVuc3Noc2VydmVyLmNvbmZpZyAvZXRjL2NyeXB0by1wb2xpY2llcy9iYWNrLWVuZHMvb3BlbnNzaHNlcnZlci5jb25maWcub3JpZwplY2hvIC1lICJDaXBoZXJzIGNoYWNoYTIwLXBvbHkxMzA1QG9wZW5zc2guY29tLGFlczI1Ni1nY21Ab3BlbnNzaC5jb20sYWVzMTI4LWdjbUBvcGVuc3NoLmNvbSxhZXMyNTYtY3RyLGFlczE5Mi1jdHIsYWVzMTI4LWN0cgpNQUNzIGhtYWMtc2hhMi0yNTYtZXRtQG9wZW5zc2guY29tLGhtYWMtc2hhMi01MTItZXRtQG9wZW5zc2guY29tLHVtYWMtMTI4LWV0bUBvcGVuc3NoLmNvbQpHU1NBUElLZXhBbGdvcml0aG1zIGdzcy1jdXJ2ZTI1NTE5LXNoYTI1Ni0KS2V4QWxnb3JpdGhtcyBjdXJ2ZTI1NTE5LXNoYTI1NixjdXJ2ZTI1NTE5LXNoYTI1NkBsaWJzc2gub3JnLGRpZmZpZS1oZWxsbWFuLWdyb3VwMTYtc2hhNTEyLGRpZmZpZS1oZWxsbWFuLWdyb3VwMTgtc2hhNTEyLGRpZmZpZS1oZWxsbWFuLWdyb3VwLWV4Y2hhbmdlLXNoYTI1NgpIb3N0S2V5QWxnb3JpdGhtcyBzc2gtZWQyNTUxOSxzc2gtZWQyNTUxOS1jZXJ0LXYwMUBvcGVuc3NoLmNvbSxyc2Etc2hhMi0yNTYscnNhLXNoYTItNTEyClB1YmtleUFjY2VwdGVkQWxnb3JpdGhtcyBzc2gtZWQyNTUxOSxzc2gtZWQyNTUxOS1jZXJ0LXYwMUBvcGVuc3NoLmNvbSxyc2Etc2hhMi0yNTYscnNhLXNoYTItNTEyCkNBU2lnbmF0dXJlQWxnb3JpdGhtcyBlY2RzYS1zaGEyLW5pc3RwMjU2LHNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20sZWNkc2Etc2hhMi1uaXN0cDM4NCxlY2RzYS1zaGEyLW5pc3RwNTIxLHNzaC1lZDI1NTE5LHNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tLHJzYS1zaGEyLTI1Nixyc2Etc2hhMi01MTIKUmVxdWlyZWRSU0FTaXplIDIwNDgiID4gL2V0Yy9jcnlwdG8tcG9saWNpZXMvYmFjay1lbmRzL29wZW5zc2hzZXJ2ZXIuY29uZmlnCnJlYm9vdAoKCg==
    owner: root:root
    path: /etc/rc.local.rebootonce
    permissions: "0755"

# Comandos a ejecutar después de la primera carga
runcmd:
  - echo "Instance setup completed" >> /var/log/cloud-init-output.log
  - [/etc/rc.local.rebootonce]
  - ['systemctl', 'restart', 'NetworkManager.service']