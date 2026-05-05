# databricks metastore module examples

databricks_metastore_data = {
  # Example 1: Production metastore with account-scoped configuration
  prod-metastore = {
    enabled        = true
    name           = "prod-metastore"
    provider_scope = "account"

    delta_sharing_scope                               = "INTERNAL"
    delta_sharing_recipient_token_lifetime_in_seconds = 3600
    delta_sharing_organization_name                   = "acme-corp"
    force_destroy                                     = false
    owner                                             = "admin@acme.com"
    storage_root                                      = "s3://acme-prod-metastore"
  }

  # Example 2: Development metastore with workspace scope
  dev-metastore = {
    enabled        = true
    name           = "dev-metastore"
    provider_scope = "workspace"

    delta_sharing_scope                               = "INTERNAL"
    delta_sharing_recipient_token_lifetime_in_seconds = 7200
    delta_sharing_organization_name                   = "acme-corp"
    force_destroy                                     = true
    owner                                             = "dev-team@acme.com"
    storage_root                                      = "s3://acme-dev-metastore"
  }

  # Example 3: Minimal configuration with only required fields
  minimal-metastore = {
    enabled        = true
    name           = "minimal-metastore"
    provider_scope = "account"
  }

  # Example 4: Disabled resource (useful for temporary removal)
  disabled-metastore = {
    enabled        = false
    name           = "disabled-metastore"
    provider_scope = "workspace"
  }
}
