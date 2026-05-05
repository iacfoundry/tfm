resource "databricks_entitlements" "entitlements" {
  for_each = { for key, value in var.databricks_entitlements_data : key => value if value.enabled }

  # Required Arguments
  # One of user_id, group_id, or service_principal_id must be provided
  user_id = try(coalesce(
    try(each.value.user_id, null),
    try(var.databricks_user_output[each.value.user_name].id, null)
  ), null)
  group_id = try(coalesce(
    try(each.value.group_id, null),
    try(var.databricks_group_output[each.value.group_name].id, null)
  ), null)
  service_principal_id = try(coalesce(
    try(each.value.service_principal_id, null),
    try(var.databricks_service_principal_output[each.value.service_principal_name].id, null)
  ), null)

  # Required Blocks 



  # Optional Arguments
  allow_cluster_create       = each.value.allow_cluster_create
  allow_instance_pool_create = each.value.allow_instance_pool_create
  databricks_sql_access      = each.value.databricks_sql_access
  workspace_access           = each.value.workspace_access

  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
