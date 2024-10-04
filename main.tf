// Copyright 2022 Isovalent, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.// Grab the current subscription.

data "azurerm_subscription" "main" {
}

// Grab the current configuration for the Azure AD provider.
data "azuread_client_config" "main" {
}

// Create a random ID for the Azure AD application.
resource "random_id" "main" {
  count = length(var.application_name) > 0 ? 0 : 1

  byte_length = 8
  prefix      = "terraform-"
}

// Create an Azure AD application.
resource "azuread_application" "main" {
  display_name = length(var.application_name) > 0 ? var.application_name : random_id.main[0].hex
  owners = [
    data.azuread_client_config.main.object_id,
  ]
}

// Create an Azure AD service principal associated with the Azure AD application.
resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id
  owners = [
    data.azuread_client_config.main.object_id,
  ]
}

// Create role assignment for the Azure AD service principal.
resource "azurerm_role_assignment" "main" {
  principal_id         = azuread_service_principal.main.object_id
  role_definition_name = var.role
  scope                = data.azurerm_subscription.main.id
}

// Create a password (client secret) for the Azure AD application.
resource "azuread_application_password" "main" {
  application_id = azuread_application.main.id
  end_date_relative     = "8640h"
}
