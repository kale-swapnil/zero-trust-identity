provider "azurerm" {
  features {}   
  subscription_id = var.subscription_id
}

provider "azuread" {
  
}

module "identity" {
  source               = "./modules/identity"
}

module "keyvault" {
  source       = "./modules/keyvault"
  kv_name      = var.kv_name
  location     = var.location
  principal_id = module.identity.service_principal_id
  resource_group_name = var.resource_group_name
}

module "policies" {
  source                   = "./modules/policies"
  policy_scope             = var.policy_scope
  allowed_owner_principals = var.allowed_owner_principals
  resource_group_id = azurerm_resource_group.main.id
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

