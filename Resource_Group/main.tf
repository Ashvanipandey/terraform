variable "name" {
  default = "rg132"
}
variable "location" {
  default = "westus2"
}
resource "azurerm_resource_group" "rg101" {
    name = var.name
    location = var.location
  
}