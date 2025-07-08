variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group where resources will be deployed"
  type        = string
}

variable "kv_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "policy_scope" {
  description = "Scope at which the policies should be assigned (e.g., subscription or resource group ID)"
  type        = string
}

variable "allowed_owner_principals" {
  description = "List of object IDs allowed to be assigned the Owner role"
  type        = list(string)
  default     = []
}

variable "github_repo_subject" {
  description = "Subject claim for GitHub Actions OIDC federation (e.g., repo:org/repo:ref:refs/heads/main)"
  type        = string
}

variable "github_oidc_issuer" {
  description = "OIDC issuer for GitHub Actions"
  type        = string
  default     = "https://token.actions.githubusercontent.com"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID where resources will be created"
  default     = ""
}
