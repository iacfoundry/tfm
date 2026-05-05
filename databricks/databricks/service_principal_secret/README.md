### SERVICE_PRINCIPAL_SECRET MODULE
## Updated 07/05/2024 16:05:27

# SERVICE_PRINCIPAL_SECRET_DATA.TFVARS EXAMPLE
```
service_principal_secret_data = {
  "secret_1" = {
    enabled                 = true
    service_principal_id    = "12345678-1234-1234-1234-123456789012"
  },
  "secret_2" = {
    enabled                 = true
    service_principal_name  = "example-service-principal"
  }
}
```

# SERVICE_PRINCIPAL_SECRET MAIN.TF MODULE REFERENCE
```
module "service_principal_secret" {
        source = "./modules/databricks/service_principal_secret"

        service_principal_secret_data = var.service_principal_secret_data
}
```

# SERVICE_PRINCIPAL_SECRET ROOT VARIABLES.TF
```
variable "service_principal_secret_data" {
  type = map(object({
    # Required
    enabled                 = bool
    service_principal_id    = optional(string)
    service_principal_name  = optional(string)

    # Optional Arguments
    # No optional arguments provided
  }))
  default = {}
}
```
