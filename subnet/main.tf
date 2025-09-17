
resource "azurerm_subnet" "subnet" {
  name = var.name
  virtual_network_name =var.vnet
  address_prefixes = [ "10.0.0.0/24" ]
  resource_group_name=var.rg
}