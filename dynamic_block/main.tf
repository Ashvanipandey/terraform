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
# variable "rg" {
#   default = "rg111"
# }
# variable "location" {
#   default = "westus"
# }
# # variable "address_prefix" {
# #   default = ["1.0.0.0/24"]
# # }
# variable "vnetname" {
#   default = "vnet01"
# }
# variable "subnetname" {
# default ={
  
#  subnet01={
#    name="subnet1"
#    address_prefix="1.0.1.0/24"
#  },
# subnet02={
#   name="subnet02"
#   address_prefix="1.0.2.0/24"
# }
#   }


# }
# resource "azurerm_resource_group" "rg" {
#   name     = var.rg
#   location = var.location
# }

# resource "azurerm_virtual_network" "vnet" {
#   resource_group_name = azurerm_resource_group.rg.name
#   name                = var.vnetname
#   location            = var.location
#   address_space       = ["1.0.0.0/16"]

#   dynamic "subnet" {
#     for_each = var.subnetname
#     content {
#       name = subnet.value.name
#       address_prefix = subnet.value.address_prefix
#     }
#   }

 
# }