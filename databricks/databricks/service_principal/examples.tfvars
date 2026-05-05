# databricks service_principal module examples

databricks_service_principal_data = {
  # Example 1: Terraform automation service principal
  terraform-sp = {
    enabled        = true
    application_id = "11111111-1111-1111-1111-111111111111"
    provider_scope = "account"

    allow_cluster_create       = false
    allow_instance_pool_create = false
    databricks_sql_access      = false
    workspace_access           = false
  }

  # Example 2: Data pipeline service principal with cluster access
  data-pipeline-sp = {
    enabled        = true
    application_id = "22222222-2222-2222-2222-222222222222"
    provider_scope = "workspace"

    allow_cluster_create  = true
    workspace_access      = true
    databricks_sql_access = true
  }

  # Example 3: Monitoring service principal (read-only)
  monitoring-sp = {
    enabled        = true
    application_id = "33333333-3333-3333-3333-333333333333"
    provider_scope = "account"

    workspace_access = true
  }

  # Example 4: Application service principal with external ID
  app-sp = {
    enabled        = true
    application_id = "44444444-4444-4444-4444-444444444444"
    provider_scope = "account"

    external_id = "app-external-123"
  }

  # Example 5: Service principal using existing Azure AD app
  existing-app-sp = {
    enabled        = true
    application_id = "55555555-5555-5555-5555-555555555555"
    provider_scope = "account"

    allow_cluster_create = true
    workspace_access     = true
  }

  # Example 6: Disabled service principal
  disabled-sp = {
    enabled        = false
    application_id = "66666666-6666-6666-6666-666666666666"
    provider_scope = "account"
  }
}
