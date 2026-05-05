resource "databricks_secret_scope" "secret_scope" {
  for_each = { for key, value in var.databricks_secret_scope_data : key => value if value.enabled }

  # Required Arguments  
  name = each.value.name

  # Optional Arguments  
  initial_manage_principal = each.value.initial_manage_principal

  # Optional Dynamic Blocks  
  dynamic "keyvault_metadata" {
    for_each = each.value.keyvault_metadata != null ? [each.value.keyvault_metadata] : []
    content {
      resource_id = coalesce(
        try(keyvault_metadata.value.resource_id, null),
        try(var.azurerm_key_vault_output["${keyvault_metadata.value.resource_name}"].id, null)
      )
      dns_name = coalesce(
        try(keyvault_metadata.value.dns_name, null),
        try(var.azurerm_key_vault_output["${keyvault_metadata.value.resource_name}"].vault_uri, null)
      )
    }
  }
}
