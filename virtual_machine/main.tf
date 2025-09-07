variable "nicname" {
  
}
variable "rg" {
  default = "rg121"
}
data "azurerm_network_interface" "nic" {
  name = var.nicname
  resource_group_name = var.rg
}
# Linux Virtual Machine with password authentication
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "my-vm"
  location              = "westus2"
  resource_group_name   = var.rg # 🔁 Replace
  size                  = "Standard_B2ms"
  admin_username        = "azureuser"
  admin_password        = "P@ssword123456!"  # 🔐 Replace with a secure password
  disable_password_authentication = false

  network_interface_ids = [data.azurerm_network_interface.nic.id]

  os_disk {
    name                 = "my-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}

}
