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

output "client_id" {
  description = "The client ID of the Azure AD service principal."
  value       = azuread_application.main.client_id
}

output "client_secret" {
  description = "The client secret of the Azure AD service principal."
  sensitive   = true
  value       = azuread_application_password.main.value
}

output "display_name" {
  description = "The display name of the Azure AD service principal."
  value       = azuread_service_principal.main.display_name
}

output "id" {
  description = "The ID of the Azure AD service principal."
  value       = azuread_service_principal.main.id
}
