provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "prod" {
  name     = "rg-prod-eastus"
  location = "East US"
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-prod"
  location            = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name
  address_space       = ["10.0.0.0/16"]

  subnets = {
    web = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }

  tags = {
    env = "prod"
  }
}