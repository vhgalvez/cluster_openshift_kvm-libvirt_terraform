# Output Server IP
output "vm_ips" {
  value = { for vm_id, vm in libvirt_domain.vm : vm_id => libvirt_domain.vm[vm_id].network_interface.0.addresses }
}
