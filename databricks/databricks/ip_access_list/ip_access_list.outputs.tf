output "databricks_ip_access_list_output" {
  value = { for key, value in databricks_ip_access_list.ip_access_list : key => value }
}

output "databricks_ip_access_list_output_labels" {
  value = { for key, value in databricks_ip_access_list.ip_access_list : value.label => value }
}
