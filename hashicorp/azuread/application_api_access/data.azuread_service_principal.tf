# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
data "azuread_service_principal" "sp" {
  for_each = { for key, value in var.azuread_application_api_access_data : key => value if value.enabled && value.api_client_id == null }

  client_id = data.azuread_application_published_app_ids.app.result["${each.value.api_client_name}"]
}
