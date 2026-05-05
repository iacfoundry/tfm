### SECRET_SCOPE MODULE
## Updated 11/11/2024 10:10:00

# SECRET_SCOPE_DATA.TFVARS EXAMPLE
```
databricks_secret_scope_data = {  
  scope1 = {  
    name                    = "terraform-demo-scope"  
    initial_manage_principal = "users"  
  }  
  scope2 = {  
    name = "keyvault-managed"  
    keyvault_metadata = {  
      resource_id = "<key_vault_id>"  
      dns_name    = "<key_vault_uri>"  
    }  
  }  
}
```

# SECRET_SCOPE MAIN.TF MODULE REFERENCE
```
module "databricks_secret_scope" {  
  source = "./modules/databricks_secret_scope"  
  
  databricks_secret_scope_data = var.databricks_secret_scope_data  
  azurerm_key_vault_output             = module.azurerm_key_vault.key_vault_output_names
}
```

# SECRET_SCOPE ROOT VARIABLES.TF
```
variable "databricks_secret_scope_data" {  
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
