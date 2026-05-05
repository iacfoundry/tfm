resource "databricks_metastore" "account_metastore" {
  for_each = { for key, value in var.databricks_metastore_data : key => value if value.enabled && value.provider_scope == "account" }

  provider = databricks.account

  # Required Arguments
  name = each.value.name

  # Required Blocks 



  # Optional Arguments
  delta_sharing_scope                               = each.value.delta_sharing_scope
  delta_sharing_recipient_token_lifetime_in_seconds = each.value.delta_sharing_recipient_token_lifetime_in_seconds
  delta_sharing_organization_name                   = each.value.delta_sharing_organization_name
  force_destroy                                     = each.value.force_destroy
  owner                                             = each.value.owner
  storage_root                                      = each.value.storage_root

  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
