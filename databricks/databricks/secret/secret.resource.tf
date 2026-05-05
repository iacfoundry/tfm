resource "databricks_secret" "secret" {
  for_each = { for key, value in var.databricks_secret_data : key => value if value.enabled }

  # Required Arguments  
  key          = each.value.key
  string_value = each.value.string_value
  scope        = each.value.scope

  # Optional Arguments  

  lifecycle {
    prevent_destroy = false
  }
}
