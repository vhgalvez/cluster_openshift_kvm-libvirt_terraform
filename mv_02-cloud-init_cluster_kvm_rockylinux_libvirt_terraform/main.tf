# Defining VM Volume
resource "libvirt_volume" "rocky9_qcow2" {
  name   = var.rocky9_volume_name
  pool   = var.rocky9_volume_pool
  source = var.rocky9_volume_source
  format = var.rocky9_volume_format
}

data "template_file" "user_data" {
  template = file("${path.module}/${each.key}-user-data.tpl")

  vars = {
    ssh_keys = join("\n  - ", var.ssh_keys)
  }
}

resource "libvirt_domain" "vm" {
  # configuración de la VM
  user_data = data.template_file.user_data.rendered
}

data "template_file" "meta_data" {
  template = file("${path.module}/meta-data.tpl")

  vars = {
    instance-id    = var.rocky9_name
    local-hostname = var.rocky9_name
  }
}

resource "libvirt_cloudinit_disk" "rocky9_cloudinit_disk" {
  name      = var.rocky9_cloudinit_disk
  pool      = var.rocky9_cloudinit_pool
  user_data = data.template_file.user_data.rendered
  meta_data = data.template_file.meta_data.rendered
}

resource "libvirt_domain" "rocky9" {
  name       = var.rocky9_name
  memory     = var.rocky9_domain_memory
  vcpu       = var.rocky9_domain_vcpu
  qemu_agent = true

  network_interface {
    network_name = var.rocky9_network_name
  }

  disk {
    volume_id = libvirt_volume.rocky9_qcow2.id
  }

  cloudinit = libvirt_cloudinit_disk.rocky9_cloudinit_disk.id

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "0"
  }

  cpu {
    mode = "host-passthrough"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}
