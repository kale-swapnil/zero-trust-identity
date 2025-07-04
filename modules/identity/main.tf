resource "azuread_application" "github_app" {
  display_name = "github-wif-app"
}

resource "azuread_service_principal" "github_sp" {

  client_id = azuread_application.github_app.id
}

resource "azuread_application_federated_identity_credential" "github_federation" {
 application_id = azuread_application.github_app.id
 display_name = "github-actions"
 audiences             = ["api://AzureADTokenExchange"]
 issuer = "https://token.actions.githubusercontent.com"
 subject = "repo:github.com/your-org/your-repo:ref:refs/heads/main"  
}