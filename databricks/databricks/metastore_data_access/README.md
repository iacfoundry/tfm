### METASTORE_DATA_ACCESS MODULE
## Updated 04/11/2024 20:32:05

# METASTORE_DATA_ACCESS_DATA.TFVARS EXAMPLE
```
metastore_data_access_data = {
  example-data-access = {
    enabled = true
    name    = "Example Data Access"

    force_destroy   = true
    force_update    = false
    is_default      = true
    metastore_id    = "metastore-123"
    owner           = "user@example.com"
    read_only       = false
    skip_validation = true

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-role"
    }

    azure_managed_identity = {
      access_connector_id = "connector-123"
      managed_identity_id = "managed-identity-123"
    }

    azure_service_principal = {
      directory_id   = "directory-123"
      application_id = "application-123"
      client_secret  = "client-secret"
    }

    databricks_gcp_service_account = {
      email = "service-account@example.iam.gserviceaccount.com"
    }
  }
}
```

# METASTORE_DATA_ACCESS MAIN.TF MODULE REFERENCE
```
module "metastore_data_access" {
        source = "./modules/databricks/metastore_data_access"

        metastore_data_access_data = var.metastore_data_access_data
}
```

# METASTORE_DATA_ACCESS ROOT VARIABLES.TF
```
variable "metastore_data_access_data" {
  type = map(object({
    # Required
    enabled = bool
    name    = string

    # Optional
    force_destroy   = optional(bool)
    force_update    = optional(bool)
    is_default      = optional(bool)
    metastore_id    = optional(string)
    owner           = optional(string)
    read_only       = optional(bool)
    skip_validation = optional(bool)

    # Optional Dynamic Blocks
    aws_iam_role = optional(object({
      role_arn = string
    }))
    azure_managed_identity = optional(object({
      access_connector_id = string
      managed_identity_id = string
    }))
    azure_service_principal = optional(object({
      directory_id   = string
      application_id = string
      client_secret  = string
    }))
    databricks_gcp_service_account = optional(object({
      email = string
    }))
  }))
  default = {}
}
```
