data "azuread_user" "owners" {
  for_each = toset(var.subscription_email)
  user_principal_name = each.value
}

resource "azurerm_role_assignment" "assign_role_by_user" {
  for_each = data.azuread_user.users
  scope = azurerm_resource_group.user_resource_group[each.key].id
  role_definition_name = "owner"
  principal_id = each.value["id"]
  depends_on = [azurerm_resource_group.user_resource_group]
}

resource "azurerm_role_assignment" "subscription_owner" {
  for_each = data.azuread_user.owners
  scope = data.azurerm_subscription.main_subscription.id
  role_definition_name = "owner"
  principal_id = each.value["id"]
}

resource "azurerm_role_assignment" "assign_role_by_dept" {
  scope = azurerm_resource_group.dept_resource_group.id
  role_definition_name = "contributor"
  principal_id = azuread_group.ad_user_group.id
}