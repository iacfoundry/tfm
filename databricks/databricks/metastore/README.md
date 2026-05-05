### METASTORE MODULE
## Updated 04/24/2024 13:41:20

# METASTORE_DATA.TFVARS EXAMPLE
```
metastore_data = {
  example-metastore = {
    enabled = true
    name    = "example-metastore"

    delta_sharing_scope                               = "example-scope"
    delta_sharing_recipient_token_lifetime_in_seconds = 3600
    delta_sharing_organization_name                   = "example-organization"
    force_destroy                                     = false
    owner                                             = "user@example.com"
    storage_root                                      = "dbfs:/example"
  }
}
```

# METASTORE MAIN.TF MODULE REFERENCE
```
module "metastore" {
        source = "./modules//metastore"

        metastore_data = var.metastore_data
}
```

# METASTORE ROOT VARIABLES.TF
```
variable "metastore_data" {
  type = map(object({
    # Required
    enabled = bool
    name    = string

    # Optional
    delta_sharing_scope                               = optional(string)
    delta_sharing_recipient_token_lifetime_in_seconds = optional(number)
    delta_sharing_organization_name                   = optional(string)
    force_destroy                                     = optional(bool)
    owner                                             = optional(string)
    storage_root                                      = optional(string)

    # Optional Dynamic Blocks
  }))
  default = {}
}
```
