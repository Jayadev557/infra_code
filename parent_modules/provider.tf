terraform {
  required_version = ">= 1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "45d2c8fb-faba-4dc1-ab43-5ad9451eef1c"
}