# databricks mws_permission_assignment module examples

databricks_mws_permission_assignment_data = {
  # Example 1: User workspace admin
  user-admin = {
    enabled                       = true
    workspace_id                  = 500001
    workspace_name                = "prod-workspace"
    workspace_resource_group_name = "rg-prod"
    principal_id                  = 1000001
    permissions                   = ["ADMIN"]

    existing_principal = true
    existing_workspace = true
  }

  # Example 2: Group workspace access
  group-contributor = {
    enabled                       = true
    workspace_id                  = 500002
    workspace_name                = "dev-workspace"
    workspace_resource_group_name = "rg-dev"
    principal_id                  = 1000002
    permissions                   = ["CONTRIBUTOR"]

    existing_principal = true
    existing_workspace = true
  }

  # Example 3: Service principal with attachment permission
  sp-attachment = {
    enabled                       = true
    workspace_id                  = 500003
    workspace_name                = "prod-workspace"
    workspace_resource_group_name = "rg-prod"
    principal_id                  = 1000003
    permissions                   = ["ATTACH_TO_RESOURCE"]

    existing_principal = true
    existing_workspace = true
  }

  # Example 4: Service principal read-only
  sp-readonly = {
    enabled                       = true
    workspace_id                  = 500004
    workspace_name                = "prod-workspace"
    workspace_resource_group_name = "rg-prod"
    principal_id                  = 1000004
    permissions                   = ["READ_ONLY"]

    existing_principal = true
    existing_workspace = true
  }

  # Example 5: User member access
  user-member = {
    enabled                       = true
    workspace_id                  = 500005
    workspace_name                = "shared-workspace"
    workspace_resource_group_name = "rg-shared"
    principal_id                  = 1000005
    permissions                   = ["USER"]

    existing_principal = true
    existing_workspace = true
  }

  # Example 6: Disabled assignment
  disabled-assignment = {
    enabled                       = false
    workspace_id                  = 500006
    workspace_name                = "archived-workspace"
    workspace_resource_group_name = "rg-archived"
    principal_id                  = 1000006
    permissions                   = ["MEMBER"]

    existing_principal = true
    existing_workspace = false
  }
}
