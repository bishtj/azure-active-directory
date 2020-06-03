
data "azuread_user" "users" {
  for_each = toset(var.user_emails)
  user_principal_name = each.value
}

data "azuread_user" "owners" {
  for_each = toset(var.subscription_email)
  user_principal_name = each.value
}

data "azurerm_subscription" "main_subscription" {}
