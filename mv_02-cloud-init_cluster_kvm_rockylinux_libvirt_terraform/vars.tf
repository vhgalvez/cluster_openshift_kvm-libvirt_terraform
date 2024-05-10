# VM name
variable "rocky9_name" {
  description = "Name of the VM"
  type        = string
}

# Qcow2 volume name
variable "rocky9_volume_name" {
  description = "Name of the Qcow2 volume"
  type        = string
}

# Pool to locate VM
variable "rocky9_volume_pool" {
  description = "Pool to locate VM"
  type        = string
}

# Size in bytes ... equals to 30GB
variable "rocky9_volume_size" {
  description = "Size of the volume in bytes"
  type        = string
}

# Volume format .. Qcow2
variable "rocky9_volume_format" {
  description = "Format of the volume"
  type        = string
}

# Which Pool to locate cloud-init.iso
variable "rocky9_cloudinit_pool" {
  description = "Pool to locate cloud-init.iso"
  type        = string
}

# Qcow2 cloud-init location
variable "rocky9_cloudinit_disk" {
  description = "Location of the Qcow2 cloud-init disk"
  type        = string
}

# Rocky linux Qcow2 disk image
variable "rocky9_volume_source" {
  description = "Source of the Rocky Linux Qcow2 disk image"
  type        = string
}

# VM Memory
variable "rocky9_domain_memory" {
  description = "Memory of the VM"
  type        = string
}

# VM CPU count
variable "rocky9_domain_vcpu" {
  description = "CPU count of the VM"
  type        = string
}

# VM Network name
variable "rocky9_network_name" {
  description = "Network name of the VM"
  type        = string
}

variable "vm_rockylinux_definitions" {
  description = "Definitions of virtual machines including CPU and memory configuration"
  type = map(object({
    cpus           = number
    memory         = number
    ip             = string
    cloudinit_disk = string
    cloudinit_pool = string
    domain_memory  = string
    volume_format  = string
    volume_pool    = string
    volume_size    = string
  }))
}
