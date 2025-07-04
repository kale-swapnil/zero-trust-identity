# 🔐 Zero Trust Identity on Azure with Terraform

This repository implements a practical Zero Trust model on Azure using modular Terraform code. It integrates Azure AD Workload Identity Federation, custom policy enforcement, and secure Key Vault access—all codified as reusable infrastructure modules.

---

## 📦 Modules Overview

`Identity` -  Creates an Azure AD application and service principal with GitHub OIDC 
`Keyvault` - Deploys a secure Key Vault and assigns RBAC access                
`Policies` -  Defines and assigns custom Azure Policies for Zero Trust enforcement 

---

## 🚀 Features

- ✅ Azure AD Workload Identity Federation (no secrets in CI/CD)
- ✅ Custom Azure Policy: Enforce Managed Identity on compute
- ✅ Custom Azure Policy: Deny Owner role assignments (with optional exceptions)
- ✅ Key Vault with RBAC-only access and public network disabled
- ✅ Modular, reusable Terraform structure

---

## 🗂️ Directory Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules/
│   ├── identity/
│   ├── keyvault/
│   └── policies/
└── policy_definitions/
    ├── enforce-managed-identity.json
    └── deny-owner-role.json
```

---

## ⚙️ Usage

### 1. Configure `terraform.tfvars`

```hcl
rg_name                  = "zero-trust-rg"
kv_name                  = "zt-keyvault"
location                 = "East US"
policy_scope             = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
allowed_owner_principals = ["<object-id-of-break-glass-user-or-sp>"]
github_repo_subject      = "repo:your-org/your-repo:ref:refs/heads/main"
```

---

## 🧠 Policy Definitions

### Enforce Managed Identity

- Denies deployment of compute resources without a system-assigned identity

### Deny Owner Role Assignment

- Blocks assignment of the Owner role except for explicitly allowed principals

---

## 📌 Requirements

- Terraform ≥ 1.3
- AzureRM Provider ≥ 3.64
- Azure CLI (for local development)
- GitHub Actions (for CI/CD with OIDC)
