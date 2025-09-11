variable "rg" {
  default = "asd"
}
variable "name" {
  default = "vnet101"
}
variable "location" {
  default = "sss"
}
variable "address_space" {
  default = ["10.0.0.0/16"]
}
resource "azurerm_virtual_network" "vnet" {
    resource_group_name = var.rg
    name = var.name
    location = var.location
    address_space = var.address_space
}