# databricks entitlements module examples

databricks_entitlements_data = {
  # Example 1: User cluster creation permissions (using user_id)
  user-cluster-create = {
    enabled = true
    user_id = "1234567890"

    allow_cluster_create = true
    workspace_access     = true
  }

  # Example 2: Group with SQL access (using group_id)
  group-sql-access = {
    enabled  = true
    group_id = "2345678901"

    databricks_sql_access = true
    workspace_access      = true
  }

  # Example 3: Service principal with all permissions (using service_principal_id)
  sp-admin = {
    enabled              = true
    service_principal_id = "3456789012"

    allow_cluster_create       = true
    allow_instance_pool_create = true
    databricks_sql_access      = true
    workspace_access           = true
  }

  # Example 4: User with limited permissions (using user_id)
  user-readonly = {
    enabled = true
    user_id = "4567890123"

    workspace_access = true
  }

  # Example 5: Disabled entitlement
  user-disabled = {
    enabled = false
    user_id = "5678901234"
  }
}
