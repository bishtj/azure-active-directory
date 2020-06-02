provider "azurerm" {
  version = "2.2.0"
  features {}
}

provider "azuread" {
  version = "0.9.0"
}

data "azurerm_subscription" "main_subscription" {}




