# databricks service_principal_secret module examples

databricks_service_principal_secret_data = {
  # Example 1: Terraform SP secret in Key Vault
  terraform-sp-secret = {
    enabled              = true
    service_principal_id = "11111111-1111-1111-1111-111111111111"
    provider_scope       = "account"
    key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/company-kv"
    secret_name          = "databricks-terraform-secret"
  }

  # Example 2: Data pipeline SP secret
  data-pipeline-sp-secret = {
    enabled              = true
    service_principal_id = "22222222-2222-2222-2222-222222222222"
    provider_scope       = "workspace"
    key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/company-kv"
    secret_name          = "databricks-data-pipeline-secret"
  }

  # Example 3: Monitoring SP secret
  monitoring-sp-secret = {
    enabled              = true
    service_principal_id = "33333333-3333-3333-3333-333333333333"
    provider_scope       = "account"
    key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/company-kv"
    secret_name          = "databricks-monitoring-secret"
  }

  # Example 4: Application SP secret
  app-sp-secret = {
    enabled              = true
    service_principal_id = "44444444-4444-4444-4444-444444444444"
    provider_scope       = "account"
    key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/company-kv"
    secret_name          = "app-secret"
  }

  # Example 5: Workspace-scoped SP secret
  workspace-sp-secret = {
    enabled              = true
    service_principal_id = "55555555-5555-5555-5555-555555555555"
    provider_scope       = "workspace"
    key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/company-kv"
    secret_name          = "workspace-sp-secret"
  }

  # Example 6: Disabled SP secret
  disabled-secret = {
    enabled              = false
    service_principal_id = "66666666-6666-6666-6666-666666666666"
    provider_scope       = "account"
    key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/company-kv"
    secret_name          = "archived-secret"
  }
}
