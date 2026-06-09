terraform {
 required_version = "4.74.0"
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
    
  }
#  backend "azurerm" {
#    resource_group_name = "rg111"
#    storage_account_name = "strglnp"
#    container_name = "container"
#    key = "terraform.tfstate"
#  }

}
provider "azurerm" {
  features {
    
  }
  subscription_id = "f3dd8656-66bf-4af3-bce9-c04adf655c30"
}
