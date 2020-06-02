data "azurerm_subscription" "main_subscription" {}

data "azuread_user" "users" {
  for_each = toset(var.user_emails)
  user_principal_name = each.value
}

resource "azuread_group" "ad_user_group" {
  name = var.dept_name
  members = values(data.azuread_user.users).*.object_id
}

resource "random_string" "random" {
  length = 5
  upper = false
  special = false
}

resource "azurerm_resource_group" "user_resource_group" {
  for_each = data.azuread_user.users
  name = "${each.value["display_name"]}-rg-${random_string.random.result}"
  location = var.resource_location

  tags = {
    owner_email = each.value["user_principal_name"]
    owner = each.value["display_name"]
  }
}

resource "azurerm_resource_group" "dept_resource_group" {
  name = "${var.dept_name}-rg"
  location = var.resource_location
  tags = {
    owner = var.dept_name
  }
}


