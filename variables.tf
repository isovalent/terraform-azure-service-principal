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

variable "application_name" {
  description = "The name to give to the Azure AD application that will be created and associated with the Azure AD service principal."
  type        = string
}

variable "role" {
  default     = "Contributor"
  description = "The role to grant to the Azure AD service principal."
  type        = string
}
