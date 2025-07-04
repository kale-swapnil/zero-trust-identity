output "key_vault_id" {
  value = azurerm_key_vault.main.id
}

output "resource_group_name" {
  value = var.resource_group_name
  
}