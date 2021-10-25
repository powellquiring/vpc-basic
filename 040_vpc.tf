locals {
  name           = "basic"
  resource_group = data.ibm_resource_group.group.id
}


resource "ibm_is_vpc" "basic" {
  name                      = local.name
  resource_group            = local.resource_group
  address_prefix_management = "manual"
}

