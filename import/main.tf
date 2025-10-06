terraform {
 required_version = ">=1.3.0"
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
    
  }

}
provider "azurerm" {
  features {
    
  }
  subscription_id = "7551370d-ce64-4050-a442-97a4bfe88e76"
}
import {
  to = azurerm_resource_group.xyz
  id= "/subscriptions/7551370d-ce64-4050-a442-97a4bfe88e76/resourcegroups/rg111"
}
resource "azurerm_resource_group" "xyz" {
  name = "rg111"
  location = "westus2"
}