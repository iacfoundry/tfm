
### APPLICATION_API_ACCESS MODULE
## Updated 05/30/2024 09:54:15

# APPLICATION_API_ACCESS_DATA.TFVARS EXAMPLE
```
application_api_access_data = {
  "example_access_1" = {
    enabled          = true
    api_client_id    = "api-client-id-1"
    application_id   = "application-id-1"
    role_ids         = ["role-id-1"]
    scope_ids        = ["scope-id-1"]
  },
  "example_access_2" = {
    enabled          = true
    api_client_name  = "api-client-name-2"
    application_name = "application-name-2"
    role_name        = "role-name-2"
    scope_name       = "scope-name-2"
  }
}
```

# APPLICATION_API_ACCESS MAIN.TF MODULE REFERENCE
```
module "application_api_access" {
        source = "./modules/azuread/application_api_access"

        application_api_access_data = var.application_api_access_data
}
```

# APPLICATION_API_ACCESS ROOT VARIABLES.TF
```
variable "application_api_access_data" {
  type = map(object({
    # Required
    enabled          = bool
    api_client_id    = optional(string)
    api_client_name  = optional(string)
    application_id   = optional(string)
    application_name = optional(string)

    # Optional
    role_ids  = optional(list(string))
    role_name = optional(string)
    scope_ids = optional(list(string))
    scope_name = optional(string)
  }))
  default = {}
}

```
