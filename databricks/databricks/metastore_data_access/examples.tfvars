# databricks metastore_data_access module examples

databricks_metastore_data_access_data = {
  # Example 1: AWS IAM role with account scope
  aws-prod-access = {
    enabled        = true
    name           = "prod-aws-access"
    provider_scope = "account"

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-metastore-role"
    }
  }

  # Example 2: Azure managed identity with workspace scope
  azure-workspace-access = {
    enabled        = true
    name           = "workspace-azure-access"
    provider_scope = "workspace"

    azure_managed_identity = {
      access_connector_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.Databricks/accessConnectors/connector-name"
      managed_identity_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.ManagedIdentity/userAssignedIdentities/msi-name"
    }
  }

  # Example 3: Azure service principal credentials
  azure-sp-access = {
    enabled        = true
    name           = "sp-azure-access"
    provider_scope = "account"

    azure_service_principal = {
      directory_id   = "00000000-0000-0000-0000-000000000000"
      application_id = "11111111-1111-1111-1111-111111111111"
      client_secret  = "client-secret-value"
    }
  }

  # Example 4: GCP service account
  gcp-prod-access = {
    enabled        = true
    name           = "prod-gcp-access"
    provider_scope = "account"

    databricks_gcp_service_account = {
      email = "databricks-sa@project-id.iam.gserviceaccount.com"
    }
  }

  # Example 5: Read-only AWS access
  aws-readonly-access = {
    enabled        = true
    name           = "readonly-aws-access"
    provider_scope = "workspace"

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-readonly-role"
    }

    read_only = true
  }

  # Example 6: Disabled credential
  disabled-access = {
    enabled        = false
    name           = "disabled-access"
    provider_scope = "account"

    aws_iam_role = {
      role_arn = "arn:aws:iam::123456789012:role/databricks-unused-role"
    }
  }
}
