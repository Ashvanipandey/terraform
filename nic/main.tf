
# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.resource_group_name # 🔁 Replace with your RG name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id # 🔁 Replace with actual subnet ID
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "example_nsg_nic_association" {
  network_interface_id      = data.azurerm_network_interface.example.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}