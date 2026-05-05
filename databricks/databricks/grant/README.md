### DATABRICKS_GRANT MODULE
## Updated 09/24/2024 13:21:08

# DATABRICKS_GRANT_DATA.TFVARS EXAMPLE
```
databricks_grant_data = {
  "grant_1" = {
    enabled            = true
    principal          = "data_scientist_group"
    privileges         = ["SELECT", "MODIFY"]
    catalog            = "main_catalog"
    schema             = "analytics_schema"
    table              = "sales_data"
  },
  "grant_2" = {
    enabled            = true
    principal          = "admin_group"
    privileges         = ["ALL PRIVILEGES"]
    catalog            = "main_catalog"
    schema             = "admin_schema"
    volume             = "logs_volume"
  }
}
```

# DATABRICKS_GRANT MAIN.TF MODULE REFERENCE
```
module "databricks_grant" {
        source = "./modules/databricks/databricks/grant"

        databricks_grant_data = var.databricks_grant_data
}
```

# DATABRICKS_GRANT ROOT VARIABLES.TF
```
variable "databricks_grant_data" {
  type = map(object({
    # Required Arguments
    enabled    = bool
    principal  = string
    privileges = list(string)

    # Optional Arguments
    catalog            = optional(string)
    external_location  = optional(string)
    foreign_connection = optional(string)
    function           = optional(string)
    model              = optional(string)
    schema             = optional(string)
    share              = optional(string)
    storage_credential = optional(string)
    table              = optional(string)
    volume             = optional(string)
  }))
  default = {}
}
```
