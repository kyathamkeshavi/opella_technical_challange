provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-dev-eastus"
  location = var.location
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-dev"
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
  address_space       = ["10.0.0.0/16"]

  subnets = {
    web = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }

  tags = var.tags
}

module "nsg" {
  source              = "../../modules/nsg"
  nsg_name            = "dev-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
  subnet_id = module.vnet.subnet_id
}

module "keyvault" {
  source              = "../../modules/keyvault"
  kv_name            = "opella-dev-kv"
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
  tenant_id           = var.tenant_id
}

# module "vm" {
#   source              = "../../modules/vm"
#   vm_name             = "dev-vm"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.dev.name
#   subnet_id           = module.vnet.subnet_id
# }

