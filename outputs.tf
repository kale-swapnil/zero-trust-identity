output "service_principal_id" {
  value = module.identity.service_principal_id
}

output "key_vault_id" {
  value = module.keyvault.key_vault_id
}
