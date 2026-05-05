variable "databricks_storage_credential_data" {
  type = map(object({
    # Required
    enabled        = bool
    name           = string
    provider_scope = optional(string, "account")

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
