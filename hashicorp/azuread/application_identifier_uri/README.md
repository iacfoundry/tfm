
### AZUREAD_APPLICATION_IDENTIFIER_URI MODULE
## Updated 01/15/2025 16:38:46

# AZUREAD_APPLICATION_IDENTIFIER_URI_DATA.TFVARS EXAMPLE
```
azuread_application_identifier_uri_data = {  
  app01 = {  
    enabled               = true  
    application_id = "00000000-0000-0000-0000-000000000000"  
    identifier_uri = "api://example.com/app"
  }  
}  
```

# AZUREAD_APPLICATION_IDENTIFIER_URI MAIN.TF MODULE REFERENCE
```
module "azuread_application_identifier_uri" {
        source = "./modules/hashicorp/azuread/application_identifier_uri"

        azuread_application_identifier_uri_data = var.azuread_application_identifier_uri_data
}
```

# AZUREAD_APPLICATION_IDENTIFIER_URI DEFAULTS TAGS.LOCAL.TF
```
azuread_application_identifier_uri = false
```

# AZUREAD_APPLICATION_IDENTIFIER_URI DEFAULTS DEFAULTS_MERGE.LOCAL.TF
```
azuread_application_identifier_uri = { for k, v in var.azuread_application_identifier_uri_data : k => merge(v, try(local.tags_used["azuread_application_identifier_uri"], false) ? { tags = merge(var.global_defaults.tags, var.environment_defaults.tags, v.tags) } : {}) }
```

# AZUREAD_APPLICATION_IDENTIFIER_URI DEFAULTS DEFAULTS.VARIABLES.TF
```
variable "azuread_application_identifier_uri_data" { default = {} }
```

# AZUREAD_APPLICATION_IDENTIFIER_URI ROOT VARIABLES.TF
```
variable "azuread_application_identifier_uri_data" {
  type = map(object({
    # Required  
    enabled        = bool
    application_id = string
    identifier_uri = string

    # Optional  
  }))
  default = {}
}
```
