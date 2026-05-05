# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "azuread_application_identifier_uri" "identifier_uri" {
  for_each = { for key, value in var.azuread_application_identifier_uri_data : key => value if value.enabled }

  # Required Arguments  
  application_id = coalesce(
    try(each.value.application_id, null),
    try(var.azuread_application_output["${each.value.application_display_name}"].id, null)
  )
  identifier_uri = coalesce(
    try(each.value.identifier_uri, null),
    try("api://${var.azuread_application_output["${each.value.application_display_name}"].client_id}", null)
  )
  # Optional Arguments  

  # Optional Dynamic Blocks  

  lifecycle {
    prevent_destroy = false
  }
}
