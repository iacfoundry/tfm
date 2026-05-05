locals {
  merged_key_vault_secret_data = {
    for key, data in var.databricks_service_principal_secret_data : key => merge(
      data,
      {
        key_vault_id   = try(data.key_vault_id, null)
        key_vault_name = try(data.key_vault_name, null)
        name           = data.secret_name
        value = coalesce(
          try(lookup({ for k, v in databricks_service_principal_secret.account_service_principal_secret : k => v.secret }, key, null), null),
          try(lookup({ for k, v in databricks_service_principal_secret.workspace_service_principal_secret : k => v.secret }, key, null), null)
        )
      }
    ) if data.enabled && ((data.key_vault_id != null) || (data.key_vault_name != null))
  }
}
