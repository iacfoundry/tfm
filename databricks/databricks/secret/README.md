### SECRET MODULE
## Updated 11/11/2024 10:10:00

# SECRET_DATA.TFVARS EXAMPLE
```
databricks_secret_data = {  
  secret1 = {  
    enabled      = true  
    key          = "publishing_api"  
    string_value = "super_secret_value"  
    scope        = "application-secret-scope"  
  }  
}
```

# SECRET MAIN.TF MODULE REFERENCE
```
module "databricks_secret" {  
  source = "./modules/databricks_secret"  
  
  databricks_secret_data   = var.databricks_secret_data  
}
```

# SECRET ROOT VARIABLES.TF
```
variable "databricks_secret_data" {  
  type = map(object({  
    # Required  
    name = string  
  
    # Optional  
    initial_manage_principal = optional(string)  
    keyvault_metadata = optional(object({  
      resource_id = string  
      dns_name    = string  
    }))  
  }))  
  default = {}  
}
```
