locals {
  name_zone1           = "basic-1"
}

resource "ibm_is_vpc_address_prefix" "basic_zone1" {
  name = local.name_zone1
  zone = "us-south-1"
  vpc  = ibm_is_vpc.basic.id
  cidr = "10.0.0.0/16"
}

resource "ibm_is_subnet" "basic_1" {
  name            = local.name_zone1
  resource_group  = local.resource_group
  vpc             = ibm_is_vpc.basic.id
  zone            = ibm_is_vpc_address_prefix.basic_zone1.zone
  ipv4_cidr_block = ibm_is_vpc_address_prefix.basic_zone1.cidr
}


