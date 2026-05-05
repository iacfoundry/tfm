data "azuread_application" "application" {
  for_each = { for key, value in var.databricks_service_principal_data : key => value if value.enabled && value.application_name != null && value.existing_application }

  display_name = each.value.application_name
}
