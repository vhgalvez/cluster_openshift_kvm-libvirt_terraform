# output.tf
output "vm_ips" {
  value = { 
    for vm_id, vm in libvirt_domain.vm : 
    vm_id => vm.network_interface.0.addresses[0] if length(vm.network_interface[0].addresses) > 0 else "No IP Assigned" 
  }
}
