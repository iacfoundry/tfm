resource "databricks_workspace_conf" "workspace_conf" {
  for_each = { for key, value in var.databricks_workspace_conf_data : key => value if value.enabled }

  # Required Arguments  
  custom_config = each.value.custom_config

  # Optional Arguments  

  lifecycle {
    prevent_destroy = false
  }
}
