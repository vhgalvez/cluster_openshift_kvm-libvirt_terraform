# VM name
variable "rocky9_name" {}

# Qcow2 volume name
variable "rocky9_volume_name" {}

# Pool to locate VM
variable "rocky9_volume_pool" {}

# Size in bytes ... equals to 30GB
variable "rocky9_volume_size" {}

# Volume format .. Qcow2
variable "rocky9_volume_format" {}

# Which Pool to locate cloud-init.iso
variable "rocky9_cloudinit_pool" {}

# Qcow2 cloud-init location
variable "rocky9_cloudinit_disk" {}

# Rocky linux Qcow2 disk image
variable "rocky9_volume_source" {}

# VM Memory
variable "rocky9_domain_memory" {}

# VM CPU count
variable "rocky9_domain_vcpu" {}

# VM Network name
variable "rocky9_network_name" {}
