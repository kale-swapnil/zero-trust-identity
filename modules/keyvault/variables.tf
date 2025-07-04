variable "kv_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "principal_id" {
  description = "Principal to assign Key Vault RBAC role"
  type        = string
}
