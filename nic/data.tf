data "azurerm_subnet" "example" {
  name                 = "subnet001"
  virtual_network_name = "vnet001"
  resource_group_name  = "rg121"
}
data "azurerm_network_interface" "example" {
  name                = var.nicname
  resource_group_name = var.resource_group_name
}
data "azurerm_network_security_group" "nsg"{

  name=var.nsgname
  resource_group_name=var.resource_group_name
}