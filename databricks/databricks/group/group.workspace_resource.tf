resource "databricks_group" "workspace_group" {
  for_each = { for key, value in var.databricks_group_data : key => value if value.enabled && value.provider_scope == "workspace" }

  provider = databricks.workspace

  # Required Arguments
  display_name = each.value.display_name


  # Required Blocks 



  # Optional Arguments
  allow_cluster_create       = each.value.allow_cluster_create
  allow_instance_pool_create = each.value.allow_instance_pool_create
  databricks_sql_access      = each.value.databricks_sql_access
  external_id                = each.value.external_id
  force                      = each.value.force
  workspace_access           = each.value.workspace_access


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
