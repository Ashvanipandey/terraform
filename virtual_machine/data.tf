
data "azurerm_network_interface" "nic" {
  name = var.nicname
  resource_group_name = var.rg
}