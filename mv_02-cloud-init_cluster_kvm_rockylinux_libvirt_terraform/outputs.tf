# Output Server IP

output "vm_ips" {
  value = { for vm_id, vm in libvirt_domain.vm : vm_id => length(vm.network_interface.0.addresses) > 0 ? vm.network_interface.0.addresses[0] : "No IP Assigned" }
}