# databricks storage_credential module examples

databricks_storage_credential_data = {
  # Example 1: AWS IAM role with account scope
  aws-prod-credential = {
    enabled        = true
    name           = "prod-aws-credential"
    provider_scope = "account"

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-storage-role"
    }
  }

  # Example 2: Azure managed identity with workspace scope
  azure-workspace-credential = {
    enabled        = true
    name           = "workspace-azure-credential"
    provider_scope = "workspace"

    azure_managed_identity = {
      access_connector_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.Databricks/accessConnectors/connector-name"
      managed_identity_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.ManagedIdentity/userAssignedIdentities/msi-name"
    }
  }

  # Example 3: Azure service principal credentials
  azure-sp-credential = {
    enabled        = true
    name           = "sp-azure-credential"
    provider_scope = "account"

    azure_service_principal = {
      directory_id   = "00000000-0000-0000-0000-000000000000"
      application_id = "11111111-1111-1111-1111-111111111111"
      client_secret  = "client-secret-value"
    }
  }

  # Example 4: GCP service account
  gcp-prod-credential = {
    enabled        = true
    name           = "prod-gcp-credential"
    provider_scope = "account"

    databricks_gcp_service_account = {
      email = "databricks-sa@project-id.iam.gserviceaccount.com"
    }
  }

  # Example 5: Read-only AWS credential
  aws-readonly-credential = {
    enabled        = true
    name           = "readonly-aws-credential"
    provider_scope = "workspace"

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-readonly-role"
    }

    read_only = true
  }

  # Example 6: Disabled credential
  disabled-credential = {
    enabled        = false
    name           = "disabled-credential"
    provider_scope = "account"

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-unused-role"
    }
  }
}
