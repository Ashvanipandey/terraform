variable "name" {
  type = string
  description = "The name of the subnet"
}
variable "rg" {
  default = "fg"
}
variable "vnet" {
  
}
variable "address_prefixes" {
  
}
data "azurerm_virtual_network" "example" {
  name                = var.vnet
  resource_group_name = "rg121"
}
resource "azurerm_subnet" "subnet" {
  name = var.name
  virtual_network_name =var.vnet
  address_prefixes = [ "10.0.0.0/24" ]
  resource_group_name=var.rg
}