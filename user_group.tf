
resource "azuread_user" "user" {
  display_name = "jbisht1"
  password = "Komplecs_1234"
  user_principal_name = "jbisht1@jaikritbishthotmail.onmicrosoft.com"
}

resource "azuread_group" "ad_user_group" {
  name = "devteam"
  members = ["${azuread_user.user.object_id}"]
}

resource "azurerm_resource_group" "user_resource_group" {
  location = "eastus"
  name = "jbisht1_resource_group"
  tags = {
    owner = "jbisht1"
    owner_email = "bisht1@jaikritbishthotmail.onmicrosoft.com"
  }
}

resource "azurerm_resource_group" "dev_team_resource_group" {
  location = "eastus"
  name = "dev_team_resource_group"

  tags = {
    owner = "devteam"
  }

}


