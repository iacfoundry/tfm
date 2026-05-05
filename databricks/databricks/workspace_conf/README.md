### DATABRICKS_WORKSPACE_CONF MODULE
## Updated 10/14/2024 10:19:00

# DATABRICKS_WORKSPACE_CONF_DATA.TFVARS EXAMPLE
```
databricks_workspace_conf_data = {  
  workspace01 = {  
    enabled       = true  
    custom_config = {  
      "enableIpAccessLists" : true  
      "maxTokenLifetimeDays": "30"  
      "enableTokensConfig"  : true  
    }  
  }  
}  
```

# DATABRICKS_WORKSPACE_CONF MAIN.TF MODULE REFERENCE
```
module "databricks_workspace_conf" {  
  source = "./modules/databricks/workspace_conf"  
  
  databricks_workspace_conf_data = var.databricks_workspace_conf_data  
}  
```

# DATABRICKS_WORKSPACE_CONF ROOT VARIABLES.TF
```
variable "databricks_workspace_conf_data" {  
  type = map(object({  
    # Required  
    enabled       = bool  
    custom_config = object({
        enableIpAccessLists                 = optional(bool)  
      maxTokenLifetimeDays                = optional(string)  
      enableTokensConfig                  = optional(bool)  
      enableDeprecatedClusterNamedInitScripts = optional(bool)  
      enableDeprecatedGlobalInitScripts   = optional(bool)
    })  
  }))  
  default = {}  
}
```
