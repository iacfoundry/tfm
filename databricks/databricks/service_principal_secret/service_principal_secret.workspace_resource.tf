resource "databricks_service_principal_secret" "workspace_service_principal_secret" {
  for_each = { for key, value in var.databricks_service_principal_secret_data : key => value if value.enabled && value.provider_scope == "workspace" }

  provider = databricks.workspace

  # Required Arguments
  service_principal_id = coalesce(
    try(each.value.service_principal_id, null),
    try(var.databricks_service_principal_output["${each.value.service_principal_name}"].id, null)
  )

  # Required Blocks 


  # Optional Arguments


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
