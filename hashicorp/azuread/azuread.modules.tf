# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
module "azuread_app_role_assignment" {
  source = "./modules/hashicorp/azuread/app_role_assignment"

  azuread_app_role_assignment_data = var.azuread_app_role_assignment_data
  azuread_service_principal_output = module.azuread_service_principal.azuread_service_principal_output_names
}

module "azuread_application" {
  source = "./modules/hashicorp/azuread/application"

  azuread_application_data = var.azuread_application_data
}

module "azuread_application_api_access" {
  source = "./modules/hashicorp/azuread/application_api_access"

  azuread_application_api_access_data     = var.azuread_application_api_access_data
  azuread_application_registration_output = module.azuread_application_registration.azuread_application_registration_output_names
}

module "azuread_application_identifier_uri" {
  source = "./modules/hashicorp/azuread/application_identifier_uri"

  azuread_application_identifier_uri_data = var.azuread_application_identifier_uri_data
  azuread_application_output              = module.azuread_application.azuread_application_output_names
}

module "azuread_application_password" {
  source = "./modules/hashicorp/azuread/application_password"

  azuread_application_password_data       = var.azuread_application_password_data
  azuread_application_registration_output = module.azuread_application_registration.azuread_application_registration_output_names
  azurerm_key_vault_output                = module.azurerm_key_vault.azurerm_key_vault_output_names
  azuread_application_output              = module.azuread_application.azuread_application_output_names
}

module "azuread_application_registration" {
  source = "./modules/hashicorp/azuread/application_registration"

  azuread_application_registration_data = var.azuread_application_registration_data
}

module "azuread_group" {
  source = "./modules/hashicorp/azuread/group"

  azuread_group_data = var.azuread_group_data
}

module "azuread_group_member" {
  source = "./modules/hashicorp/azuread/group_member"

  azuread_group_member_data             = var.azuread_group_member_data
  azuread_group_output                  = module.azuread_group.azuread_group_output_names
  azuread_service_principal_output      = module.azuread_service_principal.azuread_service_principal_output_names
  azurerm_user_assigned_identity_output = module.azurerm_user_assigned_identity.azurerm_user_assigned_identity_output_names
}

module "azuread_service_principal" {
  source = "./modules/hashicorp/azuread/service_principal"

  azuread_service_principal_data          = var.azuread_service_principal_data
  azuread_application_registration_output = module.azuread_application_registration.azuread_application_registration_output_names
  azuread_application_output              = module.azuread_application.azuread_application_output_names
}
