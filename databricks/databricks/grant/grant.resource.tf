resource "databricks_grant" "grant" {
  for_each = { for key, value in var.databricks_grant_data : key => value if value.enabled }

  # Required Arguments
  principal  = each.value.principal
  privileges = each.value.privileges

  # Required Blocks 



  # Optional Arguments
  catalog            = each.value.catalog
  external_location  = each.value.external_location
  foreign_connection = each.value.foreign_connection
  function           = each.value.function
  model              = each.value.model
  schema             = each.value.schema
  share              = each.value.share
  storage_credential = each.value.storage_credential
  table              = each.value.table
  volume             = each.value.volume




  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
