module "rg" {
  source = "../../Resource_Group"
  name = "rg-hub"
  location = "westus2"
}
module "rg1" {
  source = "../../Resource_Group"
  name = "rg-spok1"
  location = "westus2"
}
module "rg2" {
  source = "../../Resource_Group"
  name = "rg-spok2"
  location = "westus2"
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../../Virtual_Network"
  name = "vnet-hub"
  location = "westus2"
  rg="rg-hub"
  address_space = ["10.1.0.0/24"]
}

module "vnet2" {
  depends_on = [ module.rg1 ]
  source = "../../Virtual_Network"
  name = "vnet-spok1"
  location = "westus2"
  rg="rg-spok1"
  address_space = ["10.2.0.0/24"]
}
module "vnet3" {
  depends_on = [ module.rg2 ]
  source = "../../Virtual_Network"
  name = "vnet-spok2"
  location = "westus2"
  rg="rg-spok2"
  address_space = ["10.3.0.0/24"]
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../../subnet"
  name = "AzureFirewallSubnet"
  address_prefixes = [ "10.1.0.0/27" ]
  vnet = "vnet-hub"
  rg="rg-hub"
}
module "subnet1" {
  depends_on = [ module.vnet2 ]
  source = "../../subnet"
  name = "spoke1sbnet"
  address_prefixes = [ "10.2.0.0/27" ]
  vnet = "vnet-spok1"
  rg="rg-spok1"
}
module "subnet2" {
  depends_on = [ module.vnet3 ]
  source = "../../subnet"
  name = "spok2subnet"
  address_prefixes = [ "10.3.0.0/27" ]
  vnet = "vnet-spok2"
  rg="rg-spok2"
}
# module "vm" {
#     depends_on = [ module.subnet,module.nic ]
#     count = 2
#   source = "../../virtual_machine"
#   nicname = "my-nic${count.index}"
#   virtual_machine_name="my-vm${count.index}"
#   location = "westus2"
#   rg = "rg127"
#   osdiscname = "my0os-disc-name-${count.index}"
# }
# # module "lb" {
# #     depends_on = [ module.vm ]
# #   source = "../../loadbalancer"
# #   rg="rg121"
# #   nsgname = "nsg001"
# # }
module "nic" {
    depends_on = [ module.subnet ,module.nsg]
    # count = 2
  source = "../../nic"
  location ="westus2"
  resource_group_name = "rg-hub"
  # nicname = "my-nic${count.index}"
  nicname = "nic-hub"
  nsgname = "nsg-hub"
  Virtual_Network="vnet-hub"

}
module "nsg" {
    depends_on = [ module.rg ]
  source = "../../nsg"
  name = "nsg-hub"
  rg="rg-hub"
  location = "westus2"
}
//k