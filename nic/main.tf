data "azurerm_subnet" "example" {
  name                 = "subnet001"
  virtual_network_name = "vnet001"
  resource_group_name  = "rg121"
}
variable "nicname" {
  
}
variable "location" {
  
}
variable "resource_group_name" {
  
}
# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "my-nic"
  location            = "westus2"
  resource_group_name = "rg121"  # 🔁 Replace with your RG name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id # 🔁 Replace with actual subnet ID
    private_ip_address_allocation = "Dynamic"
  }
}