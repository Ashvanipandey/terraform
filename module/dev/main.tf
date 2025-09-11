module "rg" {
  source = "../../Resource_Group"
  name = "rg121"
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../../Virtual_Network"
  name = "vnet001"
  location = "westus2"
  rg="rg121"
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../../subnet"
  name = "subnet001"
  address_prefixes = [ "10.0.0.0/24" ]
  vnet = "vnet001"
  rg="rg121"
}
module "vm" {
    depends_on = [ module.subnet,module.nic ]
  source = "../../virtual_machine"
  nicname = "my-nic"
}
module "lb" {
    depends_on = [ module.vm ]
  source = "../../loadbalancer"
  rg="rg121"
  nsgname = "nsg001"
}
module "nic" {
    depends_on = [ module.subnet ]
  source = "../../nic"
}
module "nsg" {
    depends_on = [ module.rg ]
  source = "../../nsg"
  name = "nsg001"
  rg="rg121"
  location = "westus2"
}