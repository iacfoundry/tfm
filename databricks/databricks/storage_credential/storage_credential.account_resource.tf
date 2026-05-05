resource "databricks_storage_credential" "account_storage_credential" {
  for_each = { for key, value in var.databricks_storage_credential_data : key => value if value.enabled && value.provider_scope == "account" }

  provider = databricks.account

  # Required Arguments
  name = each.value.name



  # Required Blocks 



  # Optional Arguments
  force_destroy   = each.value.force_destroy
  force_update    = each.value.force_update
  metastore_id    = each.value.metastore_id
  owner           = each.value.owner
  read_only       = each.value.read_only
  skip_validation = each.value.skip_validation


  # Optional Dynamic Blocks
  dynamic "aws_iam_role" {
    for_each = each.value.aws_iam_role != null ? [1] : []

    content {
      role_arn = each.value.aws_iam_role.role_arn
    }
  }

  dynamic "azure_managed_identity" {
    for_each = each.value.azure_managed_identity != null ? [1] : []

    content {
      # Required
      access_connector_id = each.value.azure_managed_identity.access_connector_id
      managed_identity_id = each.value.azure_managed_identity.managed_identity_id
    }
  }

  dynamic "azure_service_principal" {
    for_each = each.value.azure_service_principal != null ? [1] : []

    content {
      # Required
      directory_id   = each.value.azure_service_principal.directory_id
      application_id = each.value.azure_service_principal.application_id
      client_secret  = each.value.azure_service_principal.client_secret
    }
  }

  dynamic "databricks_gcp_service_account" {
    for_each = each.value.databricks_gcp_service_account != null ? [1] : []

    content {
      email = each.value.databricks_gcp_service_account.email
    }
  }


  lifecycle {
    prevent_destroy = false
  }
}
