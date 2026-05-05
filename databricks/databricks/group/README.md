### DATABRICKS_GROUP MODULE
## Updated 09/24/2024 09:40:36

# DATABRICKS_GROUP_DATA.TFVARS EXAMPLE
```
databricks_group_data = {
  "group_1" = {
    enabled                  = true
    display_name             = "Data Scientists"
    allow_cluster_create     = true
    allow_instance_pool_create = false
    databricks_sql_access    = true
    external_id              = "ext-group-123"
    force                    = false
    workspace_access         = true
  },
  "group_2" = {
    enabled                  = true
    display_name             = "Admins"
    allow_cluster_create     = true
    allow_instance_pool_create = true
    databricks_sql_access    = true
    external_id              = null
    force                    = true
    workspace_access         = true
  }
}
```

# DATABRICKS_GROUP MAIN.TF MODULE REFERENCE
```
module "databricks_databricks_group" {
        source = "./modules/databricks/databricks/databricks_group"

        databricks_group_data = var.databricks_group_data
}
```

# DATABRICKS_GROUP DEFAULTS TAGS.LOCAL.TF
```
databricks_group = false
```

# DATABRICKS_GROUP DEFAULTS DEFAULTS_MERGE.LOCAL.TF
```
databricks_group = { for k, v in var.databricks_group_data : k => merge(v, try(local.tags_used["databricks_group"], false) ? { tags = merge(var.global_defaults.tags, var.environment_defaults.tags, v.tags) } : {}) }
```

# DATABRICKS_GROUP DEFAULTS DEFAULTS.VARIABLES.TF
```
variable "databricks_group_data" { default = {} }
```

# DATABRICKS_GROUP ROOT VARIABLES.TF
```
variable "databricks_group_data" {
  type = map(object({
    # Required Arguments
    enabled        = bool
    display_name   = string

    # Optional Arguments
    allow_cluster_create       = optional(bool)
    allow_instance_pool_create = optional(bool)
    databricks_sql_access      = optional(bool)
    external_id                = optional(string)
    force                      = optional(bool)
    workspace_access           = optional(bool)
  }))
  default = {}
}
```
