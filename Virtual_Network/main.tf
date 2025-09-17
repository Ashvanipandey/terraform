
resource "azurerm_virtual_network" "vnet" {
    resource_group_name = var.rg
    name = var.name
    location = var.location
    address_space = var.address_space
}