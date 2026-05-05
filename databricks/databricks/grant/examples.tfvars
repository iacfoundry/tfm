# databricks grant module examples

databricks_grant_data = {
  # Example 1: Grant catalog usage to user
  user-catalog-usage = {
    enabled    = true
    principal  = "alice@company.com"
    privileges = ["USE_CATALOG"]

    catalog = "main"
  }

  # Example 2: Grant schema SELECT to group
  group-schema-select = {
    enabled    = true
    principal  = "data-analysts"
    privileges = ["USE_SCHEMA", "SELECT", "READ_METADATA"]

    schema = "main.default"
  }

  # Example 3: Grant table operations
  user-table-operations = {
    enabled    = true
    principal  = "bob@company.com"
    privileges = ["SELECT", "INSERT", "UPDATE", "DELETE", "MODIFY"]

    table = "main.default.users"
  }

  # Example 4: Grant volume access
  group-volume-access = {
    enabled    = true
    principal  = "engineers"
    privileges = ["READ_VOLUME", "WRITE_VOLUME"]

    volume = "main.data_lake"
  }

  # Example 5: Grant external location access
  sp-external-location = {
    enabled    = true
    principal  = "terraform-service-principal"
    privileges = ["READ_FILES", "WRITE_FILES"]

    external_location = "s3_data_lake"
  }

  # Example 6: Grant storage credential usage
  admin-storage-credential = {
    enabled    = true
    principal  = "admins"
    privileges = ["USE_STORAGE_CREDENTIAL"]

    storage_credential = "s3_credential"
  }
}
