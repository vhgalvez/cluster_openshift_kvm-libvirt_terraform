rocky9_cloudinit_disk = "rocky9_cloudinit_disk.iso"
rocky9_cloudinit_pool = "default"
rocky9_domain_memory  = "4096"
rocky9_domain_name    = "Golden_Rocky_9_2-TF"
rocky9_domain_vcpu    = "2"
rocky9_name           = "rockylinux92"
rocky9_network_name   = "default"
rocky9_volume_format  = "qcow2"
rocky9_volume_name    = "Golden_Rocky_9_2-TF.qcow2"
rocky9_volume_pool    = "default"
rocky9_volume_size    = "32212254720"
rocky9_volume_source  = "/var/lib/libvirt/images/rocky_image/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"

vm_rockylinux_definitions = {
  "bastion1"       = { cpus = 2, memory = 2048, ip = "10.17.3.21"},
  "freeipa1"       = { cpus = 2, memory = 2048, ip = "10.17.3.22"},
  "load_balancer1" = { cpus = 2, memory = 2048, ip = "10.17.3.18"},
  "postgresql1"    = { cpus = 2, memory = 2048, ip = "10.17.3.20"},
}
