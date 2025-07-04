variable "policy_scope" {
  description = "Scope at which to assign policies"
  type        = string
}

variable "allowed_owner_principals" {
  description = "List of object IDs allowed to be assigned the Owner role"
  type        = list(string)
}

variable "resource_group_id" {
  description = "id of the resource group"
  type = string
}
