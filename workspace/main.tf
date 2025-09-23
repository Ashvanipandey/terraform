terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
  }
 required_version = ">=1.3.0"
}
provider "azurerm" {
  features {
    
  }
  subscription_id = "7551370d-ce64-4050-a442-97a4bfe88e76"
}
resource "azurerm_resource_group" "rg101" {
    name = "rg-${terraform.workspace}"
    location = "east us"
  
}