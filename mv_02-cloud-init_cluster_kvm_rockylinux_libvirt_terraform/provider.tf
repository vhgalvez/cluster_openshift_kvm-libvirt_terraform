terraform {
  required_version = "= 1.8.2"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }

}


provider "libvirt" {
  #uri = "qemu:///system"
  alias = "libvirt"
  uri   = "qemu+ssh://root@192.168.122.1:2223/system"
}
