module "rg" {
  source = "../../Resource_Group"
  name = "rg127"
  location = "westus2"
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../../Virtual_Network"
  name = "vnet011"
  location = "westus2"
  rg="rg127"
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../../subnet"
  name = "subnet001"
  address_prefixes = [ "10.0.0.0/24" ]
  vnet = "vnet011"
  rg="rg127"
}
module "vm" {
    depends_on = [ module.subnet,module.nic ]
    count = 2
  source = "../../virtual_machine"
  nicname = "my-nic${count.index}"
  virtual_machine_name="my-vm${count.index}"
  location = "westus2"
  rg = "rg127"
  osdiscname = "my0os-disc-name-${count.index}"
}
# module "lb" {
#     depends_on = [ module.vm ]
#   source = "../../loadbalancer"
#   rg="rg121"
#   nsgname = "nsg001"
# }
module "nic" {
    depends_on = [ module.subnet ,module.nsg]
    count = 2
  source = "../../nic"
  location ="westus2"
  resource_group_name = "rg127"
  nicname = "my-nic${count.index}"
  nsgname = "nsg001"

}
module "nsg" {
    depends_on = [ module.rg ]
  source = "../../nsg"
  name = "nsg001"
  rg="rg127"
  location = "westus2"
}
//k