locals {
  keys           = [data.ibm_is_ssh_key.ssh_key.id]
  // keys           = [ibm_is_ssh_key.generated_key.id]
}
data "ibm_is_image" "name" {
  name = var.image_name
}

data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}

resource "ibm_is_instance" "basic_1" {
  name           = ibm_is_subnet.basic_1.name
  vpc            = ibm_is_vpc.basic.id
  zone           = ibm_is_subnet.basic_1.zone
  image          = data.ibm_is_image.name.id
  keys           = local.keys
  profile        = var.profile
  resource_group = local.resource_group
  primary_network_interface {
    subnet = ibm_is_subnet.basic_1.id
  }
}

resource "ibm_is_floating_ip" "basic_1" {
  name           = ibm_is_instance.basic_1.name
  target         = ibm_is_instance.basic_1.primary_network_interface[0].id
  resource_group = ibm_is_instance.basic_1.resource_group
}

output "basic_1" {
  value = {
    name                 = ibm_is_instance.basic_1.name
    primary_ipv4_address = ibm_is_instance.basic_1.primary_network_interface[0].primary_ipv4_address
    fip                  = ibm_is_floating_ip.basic_1.address
  }
}

resource "ibm_is_security_group_rule" "inbound_ssh" {
  group     = ibm_is_vpc.basic.default_security_group
  direction = "inbound"
  tcp {
    port_min = 22
    port_max = 22
  }
}

