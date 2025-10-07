terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b3e9b690-1f69-4cae-899a-6a1c65b2db91"
}
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}
variable "rg" {
  default = "rg111"
}
variable "location" {
  default = "westus"
}
# variable "address_prefix" {
#   default = ["1.0.0.0/24"]
# }
variable "vnetname" {
  default = "vnet01"
}
resource "azurerm_virtual_network" "vnet" {
  resource_group_name = azurerm_resource_group.rg.name
  name                = var.vnetname
  location            = var.location
  address_space       = ["1.0.0.0/16"]
}
output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}
