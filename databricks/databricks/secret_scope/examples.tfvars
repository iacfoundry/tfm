# databricks secret_scope module examples

databricks_secret_scope_data = {
  # Example 1: Standard managed scope
  database-scope = {
    enabled = true
    name    = "database"

    initial_manage_principal = "admins"
  }

  # Example 2: External API scope
  external-apis-scope = {
    enabled = true
    name    = "external_apis"

    initial_manage_principal = "engineering"
  }

  # Example 3: Cloud credentials scope
  cloud-creds-scope = {
    enabled = true
    name    = "cloud_credentials"

    initial_manage_principal = "admin@company.com"
  }

  # Example 4: Key Vault backed scope
  keyvault-scope = {
    enabled = true
    name    = "production-secrets"

    keyvault_metadata = {
      resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.KeyVault/vaults/my-vault"
      resource_name = "my-vault"
      dns_name      = "https://my-vault.vault.azure.net/"
    }
  }

  # Example 5: GitHub tokens scope
  github-scope = {
    enabled = true
    name    = "github"

    initial_manage_principal = "dev-team"
  }

  # Example 6: Disabled scope
  disabled-scope = {
    enabled = false
    name    = "archived-secrets"
  }
}
