### DATABRICKS_ENTITLEMENTS MODULE
## Updated 03/26/2025

# DATABRICKS_ENTITLEMENTS_DATA.TFVARS EXAMPLE
```
databricks_entitlements_data = {
  "entitlements_1" = {
    enabled                    = true
    group_id                   = "group1"
    allow_cluster_create       = true
    allow_instance_pool_create = false
    databricks_sql_access      = true
    workspace_access           = true
  }
}
```

# DATABRICKS_ENTITLEMENTS MAIN.TF MODULE REFERENCE
```
module "databricks_databricks_entitlements" {
        source = "./modules/databricks/databricks/entitlements"

        databricks_entitlements_data = var.databricks_entitlements_data
}
```

# DATABRICKS_ENTITLEMENTS ROOT VARIABLES.TF
```
variable "databricks_entitlements_data" {
  type = map(object({
    # Required Arguments
    enabled              = bool
    user_id              = string
    group_id             = string
    service_principal_id = string

    # Optional Arguments
    allow_cluster_create       = optional(bool)
    allow_instance_pool_create = optional(bool)
    databricks_sql_access      = optional(bool)
    workspace_access           = optional(bool)
  }))
  default = {}
}
```
