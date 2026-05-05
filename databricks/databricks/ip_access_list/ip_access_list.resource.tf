resource "databricks_ip_access_list" "ip_access_list" {
  for_each = { for key, value in var.databricks_ip_access_list_data : key => value if value.enabled }

  # Required Arguments  
  label        = each.value.label
  list_type    = each.value.list_type
  ip_addresses = each.value.ip_addresses

  # Optional Arguments  
  enabled = each.value.enabled

  lifecycle {
    prevent_destroy = false
  }
}
