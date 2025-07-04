resource "azurerm_key_vault" "main" {
  name = var.kv_name
  location = var.location
  resource_group_name = var.resource_group_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
  purge_protection_enabled = true
  public_network_access_enabled = false
}

resource "azurerm_role_assignment" "kv_rbac" {
  principal_id = var.principal_id
  role_definition_name = "Key Vaults Secret User"
  scope = azurerm_key_vault.main.id
  
}

data "azurerm_client_config" "current" {
}
