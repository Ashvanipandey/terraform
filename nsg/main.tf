variable "name" {
  
}
variable "location" {
  
}
variable "rg" {
  
}
resource "azurerm_network_security_group" "nsg" {
  name = var.name
  location = var.location
  resource_group_name = var.rg
  
    security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}