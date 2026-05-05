resource "databricks_service_principal" "workspace_service_principal" {
  for_each = { for key, value in var.databricks_service_principal_data : key => value if value.enabled && value.provider_scope == "workspace" }

  provider = databricks.workspace

  # Required Arguments
  application_id = coalesce(
    try(each.value.application_id, null),
    try(var.azuread_application_registration_output["${each.value.application_name}"].client_id, null),
    try(data.azuread_application.application["${each.key}"].client_id, null)
  )

  # Required Blocks 



  # Optional Arguments
  active                     = each.value.active
  allow_cluster_create       = each.value.allow_cluster_create
  allow_instance_pool_create = each.value.allow_instance_pool_create
  databricks_sql_access      = each.value.databricks_sql_access
  disable_as_user_deletion   = each.value.disable_as_user_deletion
  display_name               = each.value.display_name
  external_id                = each.value.external_id
  force_delete_home_dir      = each.value.force_delete_home_dir
  force_delete_repos         = each.value.force_delete_repos
  force                      = each.value.force
  workspace_access           = each.value.workspace_access


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
