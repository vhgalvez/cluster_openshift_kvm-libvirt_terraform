# terraform.tfvars
rocky9_image = "/var/lib/libvirt/images/rocky_image/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"

vm_rockylinux_definitions = {
  "bastion1"       = { cpus = 2, memory = 2048, ip = "10.17.3.21", cloudinit_disk = "rocky9_cloudinit_disk.iso", cloudinit_pool = "default", domain_memory = "4096", volume_format = "qcow2", volume_pool = "default", volume_size = "32212254720" },
  "freeipa1"       = { cpus = 2, memory = 2048, ip = "10.17.3.22", cloudinit_disk = "rocky9_cloudinit_disk.iso", cloudinit_pool = "default", domain_memory = "4096", volume_format = "qcow2", volume_pool = "default", volume_size = "32212254720" },
  "load_balancer1" = { cpus = 2, memory = 2048, ip = "10.17.3.18", cloudinit_disk = "rocky9_cloudinit_disk.iso", cloudinit_pool = "default", domain_memory = "4096", volume_format = "qcow2", volume_pool = "default", volume_size = "32212254720" },
  "postgresql1"    = { cpus = 2, memory = 2048, ip = "10.17.3.20", cloudinit_disk = "rocky9_cloudinit_disk.iso", cloudinit_pool = "default", domain_memory = "4096", volume_format = "qcow2", volume_pool = "default", volume_size = "32212254720" },
}

cluster_name   = "cluster_cefaslocalserver"
cluster_domain = "cefaslocalserver.com"

ssh_keys = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC9XqGWEd2de3Ud8TgvzFchK2/SYh+WHohA1KEuveXjCbse9aXKmNAZ369vaGFFGrxbSptMeEt41ytEFpU09gAXM6KSsQWGZxfkCJQSWIaIEAdft7QHnTpMeronSgYZIU+5P7/RJcVhHBXfjLHV6giHxFRJ9MF7n6sms38VsuF2s4smI03DWGWP6Ro7siXvd+LBu2gDqosQaZQiz5/FX5YWxvuhq0E/ACas/JE8fjIL9DQPcFrgQkNAv1kHpIWRqSLPwyTMMxGgFxGI8aCTH/Uaxbqa7Qm/aBfdG2lZBE1XU6HRjAToFmqsPJv4LkBxaC1Ag62QPXONNxAA97arICr vhgalvez@gmail.com"
]
