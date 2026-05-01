provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-dev-eastus"
  location = "East US"
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-dev"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  address_space       = ["10.0.0.0/16"]

  subnets = {
    web = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }

  tags = {
    env = "dev"
  }
}