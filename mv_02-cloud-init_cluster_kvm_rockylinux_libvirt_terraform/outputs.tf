# Output Server IP
output "vm_ips" {
  value = { for vm in libvirt_domain.vm : vm.key => vm.value.network_interface[0].addresses }
}
