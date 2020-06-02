
data "azuread_user" "users" {
  for_each = toset(var.user_emails)
  user_principal_name = each.value
}

resource "azuread_group" "ad_user_group" {
  name = var.dept_name
  members = values(data.azuread_user.users).*.object_id
}

resource "azurerm_resource_group" "user_resource_group" {
  for_each = data.azuread_user.users
  name = "${each.value["display_name"]}-rg"
  location = var.resource_location

  tags = {
    owner_email = each.value["user_principal_name"]
    owner = each.value["display_name"]
  }
}

resource "azurerm_resource_group" "dept_resource_group" {
  name = "dept_resource_group"
  location = var.resource_location
  tags = {
    owner = var.dept_name
  }
}


