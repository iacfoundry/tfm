data "databricks_metastore" "account_metastore_region" {
  for_each = { for key, value in var.databricks_metastore_assignment_data : key => value if value.enabled && value.metastore_region != null && value.provider_scope == "account" }
  provider = databricks

  region = each.value.metastore_region
}

data "databricks_metastore" "account_metastore_name" {
  for_each = { for key, value in var.databricks_metastore_assignment_data : key => value if value.enabled && value.metastore_name != null && value.provider_scope == "account" }
  provider = databricks

  name = each.value.metastore_name
}

data "databricks_metastore" "workspace_metastore_region" {
  for_each = { for key, value in var.databricks_metastore_assignment_data : key => value if value.enabled && value.metastore_region != null && value.provider_scope == "workspace" }
  provider = databricks.workspace

  region = each.value.metastore_region
}

data "databricks_metastore" "workspace_metastore_name" {
  for_each = { for key, value in var.databricks_metastore_assignment_data : key => value if value.enabled && value.metastore_name != null && value.provider_scope == "workspace" }
  provider = databricks.workspace

  name = each.value.metastore_name
}
