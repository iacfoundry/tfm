### DATABRICKS_IP_ACCESS_LIST MODULE
## Updated 10/14/2024 10:19:00

# DATABRICKS_IP_ACCESS_LIST_DATA.TFVARS EXAMPLE
```
databricks_ip_access_list_data = {  
  ip_access_list_01 = {  
    enabled      = true

    scope = "workspace"
    label        = "allow_in"  
    list_type    = "ALLOW"  
    ip_addresses = ["1.1.1.1", "1.2.3.0/24", "1.2.5.0/24"]  
  } 
  ip_access_list_02 = {  
    enabled      = true

    scope = "account"
    label        = "allow_in"  
    list_type    = "ALLOW"  
    ip_addresses = ["1.1.1.1", "1.2.3.0/24", "1.2.5.0/24"]  
  }  
}  

```

# DATABRICKS_IP_ACCESS_LIST MAIN.TF MODULE REFERENCE
```
module "databricks_ip_access_list" {  
  source = "./modules/databricks/ip_access_list"  
  
  databricks_ip_access_list_data = var.databricks_ip_access_list_data  
}  
```

# DATABRICKS_IP_ACCESS_LIST ROOT VARIABLES.TF
```
variable "databricks_ip_access_list_data" {  
  type = map(object({  
    # Required  
    enabled      = bool
    label        = string  
    list_type    = string  
    ip_addresses = list(string)  
  
    # Optional  
  }))  
  default = {}  
}
```
