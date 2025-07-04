resource "azurerm_policy_definition" "enforce_mi" {
    name = "enforce-managed-identity"
    policy_type = "Custom"
    mode = "All"
    display_name = "Enforce Managed Identity"
    policy_rule = file("${path.module}/../../policy_definitions/enforce-managed-identity.json")

}

data "azurerm_subscription" "current" {
  
}

resource "azurerm_resource_group_policy_assignment" "enforce_mi_assignment" {
  name = "enforce-managed-identity"
  policy_definition_id = azurerm_policy_definition.enforce_mi.id
  resource_group_id = var.resource_group_id
}