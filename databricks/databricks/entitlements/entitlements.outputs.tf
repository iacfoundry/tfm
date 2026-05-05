output "databricks_entitlements_output" {
  value = { for key, value in databricks_entitlements.entitlements : key => value }
}
