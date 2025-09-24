terraform {
 required_version = ">=1.3.0"
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
    
  }
 backend "azurerm" {
   resource_group_name = "rg111"
   storage_account_name = "strglnp"
   container_name = "container"
   key = "terraform.tfstate"
 }

}
provider "azurerm" {
  features {
    
  }
  subscription_id = "7551370d-ce64-4050-a442-97a4bfe88e76"
}