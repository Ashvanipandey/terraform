
data "azurerm_virtual_network" "example" {
  name                = var.vnet
  resource_group_name = "rg121"
}