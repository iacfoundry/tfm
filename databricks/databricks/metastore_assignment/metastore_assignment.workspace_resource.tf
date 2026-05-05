resource "databricks_metastore_assignment" "workspace_metastore_assignment" {
  for_each = { for key, value in var.databricks_metastore_assignment_data : key => value if value.enabled && value.provider_scope == "workspace" }

  provider = databricks.workspace

  # Required Arguments
  metastore_id = coalesce(
    try(data.databricks_metastore.workspace_metastore_region["${each.key}"].id, null), # Already existing and using region to look up
    try(data.databricks_metastore.workspace_metastore_name["${each.key}"].id, null),   # Already existing and using name to look up
    try(each.value.metastore_id, null),                                                # Already existing metastore_id provided
    try(var.databricks_metastore_output["${each.value.metastore_name}"].id, null)      # Created in this terraform state
  )
  workspace_id = coalesce(
    try(each.value.workspace_id, null),
    try(var.azurerm_databricks_workspace_output["${each.value.workspace_name}"].workspace_id, null)
  )

  # Optional Arguments

  lifecycle {
    prevent_destroy = false
  }
}