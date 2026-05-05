### SERVICE_PRINCIPAL MODULE
## Updated 05/14/2024 15:33:29

# SERVICE_PRINCIPAL_DATA.TFVARS EXAMPLE
```
service_principal_data = {
  example_service_principal = {
    enabled        = true
    application_id = "example-application-id"
    display_name   = null

    active                     = true
    allow_cluster_create       = true
    allow_instance_pool_create = true
    databricks_sql_access      = true
    disable_as_user_deletion   = false
    external_id                = "example-external-id"
    force_delete_home_dir      = false
    force_delete_repos         = false
    force                      = true
    workspace_access           = true
  },
  another_service_principal = {
    enabled        = true
    application_id = null
    display_name   = "example-display-name"

    active                     = false
    allow_cluster_create       = false
    allow_instance_pool_create = false
    databricks_sql_access      = false
    disable_as_user_deletion   = true
    external_id                = "another-external-id"
    force_delete_home_dir      = true
    force_delete_repos         = true
    force                      = false
    workspace_access           = false
  }
}
```

# SERVICE_PRINCIPAL MAIN.TF MODULE REFERENCE
```
module "databricks_service_principal" {
        source = "./modules/databricks/service_principal"

        service_principal_data = var.service_principal_data
}
```

# SERVICE_PRINCIPAL DEFAULTS TAGS.LOCAL.TF
```
service_principal = false
```

# SERVICE_PRINCIPAL DEFAULTS DEFAULTS_MERGE.LOCAL.TF
```
service_principal = { for k, v in var.service_principal_data : k => merge(v, try(local.tags_used["databricks_service_principal"], false) ? { tags = merge(var.global_defaults.tags, var.environment_defaults.tags, v.tags) } : {}) }
```

# SERVICE_PRINCIPAL DEFAULTS DEFAULTS.VARIABLES.TF
```
variable "databricks_service_principal_data" { default = {} }
```

# SERVICE_PRINCIPAL ROOT VARIABLES.TF
```
variable "databricks_service_principal_data" {
  type = map(object({
    # Required
    enabled        = bool
    application_id = optional(string)
    display_name   = optional(string)

    # Optional
    active                     = optional(bool)
    allow_cluster_create       = optional(bool)
    allow_instance_pool_create = optional(bool)
    databricks_sql_access      = optional(bool)
    disable_as_user_deletion   = optional(bool)
    external_id                = optional(string)
    force_delete_home_dir      = optional(bool)
    force_delete_repos         = optional(bool)
    force                      = optional(bool)
    workspace_access           = optional(bool)
  }))
  default = {}
}
```
