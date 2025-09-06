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
  subscription_id = "388a2121-d962-4059-8c36-c24d806cad40"
}