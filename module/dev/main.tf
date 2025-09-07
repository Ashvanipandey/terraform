module "rg" {
  source = "../../Resource_Group"
  name = "rg123"
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../../Virtual_Network"
  name = "vnet001"
  location = "westus2"
  rg="rg123"
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../../subnet"
  name = "subnet001"
  address_prefixes = [ "10.0.0.0/24" ]
  vnet = "vnet001"
  rg="rg123"
}
module "vm" {
    depends_on = [ module.subnet ]
  source = "../../virtual_machine"
}
module "lb" {
    depends_on = [ module.vm ]
  source = "../../loadbalancer"
}