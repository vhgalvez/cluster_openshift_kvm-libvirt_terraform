


https://github.com/ragrahari/elkf-helm-openshift.git
https://vocore.io/

https://github.com/OpenDevin/OpenDevin

sudo chmod -R 755 /var/lib/libvirt/images/roky_linux_mininal_isos/Rocky-9.3-x86_64-minimal.iso


sudo setenforce 0
sudo setenforce 0  # Pone SELinux en modo permisivo


[victory@server cluster_openshift_kvm_terraform]$ sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   permissive
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Memory protection checking:     actual (secure)
Max kernel policy version:      33
[victory@server cluster_openshift_kvm_terraform]$

sudo dnf install arp-scan


sudo virsh net-list --all
sudo virsh net-start default

sudo virsh net-autostart default



sudo virsh list --all
sudo virsh undefine Golden_Rocky_9_2-TF
sudo virsh destroy Golden_Rocky_9_2-TF



sudo virsh net-dhcp-leases default

sudo virsh net-dhcp-leases default
 Expiry Time           dirección MAC       Protocol   IP address           Hostname       Client ID or DUID
----------------------------------------------------------------------------------------------------------------
 2024-05-10 16:19:17   52:54:00:66:1a:d0   ipv4       192.168.122.167/24   rockylinux92   01:52:54:00:66:1a:d0


 To list all volumes in the default pool:
bash
Copy code
virsh vol-list default
To delete an existing volume if it's no longer needed:
bash
Copy code
virsh vol-delete --pool default rocky9_cloudinit_disk.iso