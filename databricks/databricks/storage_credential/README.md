### STORAGE_CREDENTIAL MODULE
## Updated 04/11/2024 21:23:01

# STORAGE_CREDENTIAL_DATA.TFVARS EXAMPLE
```
storage_credential_data = {
  example-credential = {
    enabled = true
    name    = "Example Credential"

    force_destroy   = true
    force_update    = false
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

# STORAGE_CREDENTIAL MAIN.TF MODULE REFERENCE
```
module "storage_credential" {
        source = "./modules/databricks/storage_credential"

        storage_credential_data = var.storage_credential_data
}
```

# STORAGE_CREDENTIAL ROOT VARIABLES.TF
```
variable "storage_credential_data" {
  type = map(object({
    # Required
    enabled = bool
    name    = string

    # Optional
    force_destroy   = optional(bool)
    force_update    = optional(bool)
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
