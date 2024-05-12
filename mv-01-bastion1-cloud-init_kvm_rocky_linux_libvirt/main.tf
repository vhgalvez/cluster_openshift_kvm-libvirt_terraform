# Initial setup for Open vSwitch and bridge configuration using local-exec
resource "null_resource" "ovs_setup" {
  # Executes commands to set up the bridge with Open vSwitch
  provisioner "local-exec" {
    command = <<EOF
      sudo ovs-vsctl init
      sudo ovs-vsctl add-br br0
      sudo ip addr add 192.168.0.25/24 dev br0
      sudo ip link set br0 up
EOF
  }

  # Ensures this resource is executed before VMs are created
  triggers = {
    always_run = "${timestamp()}"
  }
}

# Define the Virtual Network in libvirt using the created bridge
resource "libvirt_network" "kube_network_01" {
  name   = "kube_network_01"
  mode   = "bridge"
  bridge = "br0"
}

# Define the storage pool for VM disk images
resource "libvirt_pool" "volumetmp" {
  name = var.cluster_name
  type = "dir"
  path = "/var/lib/libvirt/images/${var.cluster_name}"
}

# Define the base volume for VMs using a Rocky Linux image
resource "libvirt_volume" "rocky9_image" {
  name   = "${var.cluster_name}-rocky9_image"
  source = var.rocky9_image
  pool   = libvirt_pool.volumetmp.name
  format = "qcow2"
}

# Configuration for each VM using a template file for user data
data "template_file" "vm_configs" {
  for_each = var.vm_rockylinux_definitions

  template = file("${path.module}/config/${each.key}-user-data.tpl")
  vars = {
    ssh_keys = jsonencode(var.ssh_keys),
    hostname = each.value.hostname,
    timezone = var.timezone
  }
}

# Create cloudinit disks for each VM
resource "libvirt_cloudinit_disk" "vm_cloudinit" {
  for_each = var.vm_rockylinux_definitions

  name      = "${each.key}_cloudinit.iso"
  pool      = libvirt_pool.volumetmp.name
  user_data = data.template_file.vm_configs[each.key].rendered
}

# Create disks for each VM
resource "libvirt_volume" "vm_disk" {
  for_each = var.vm_rockylinux_definitions

  name           = "${each.key}-${var.cluster_name}.qcow2"
  base_volume_id = libvirt_volume.rocky9_image.id
  pool           = libvirt_pool.volumetmp.name
  format         = "qcow2"
}

# Define VM resources
resource "libvirt_domain" "vm" {
  depends_on = [null_resource.ovs_setup] # Ensure the bridge is set up before VM creation

  for_each = var.vm_rockylinux_definitions

  name   = each.key
  memory = each.value.domain_memory
  vcpu   = each.value.cpus

  network_interface {
    network_id = libvirt_network.kube_network_01.id
    addresses  = [each.value.ip]
    bridge     = "br0"
  }

  disk {
    volume_id = libvirt_volume.vm_disk[each.key].id
  }

  cloudinit = libvirt_cloudinit_disk.vm_cloudinit[each.key].id

  graphics {
    type = "none" # Headless setup
  }

  cpu {
    mode = "host-passthrough"
  }
}
