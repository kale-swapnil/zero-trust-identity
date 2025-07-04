output "service_principal_id" {
  value = azuread_service_principal.github_sp.object_id
}
