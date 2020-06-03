data "azurerm_subscription" "main_subscription" {}

data "azuread_user" "users" {
  for_each = toset(var.user_emails)
  user_principal_name = each.value
}