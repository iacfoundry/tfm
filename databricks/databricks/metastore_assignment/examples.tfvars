# databricks metastore_assignment module examples

databricks_metastore_assignment_data = {
  # Example 1: Assign metastore to workspace (dev environment)
  workspace-dev-assignment = {
    enabled = true

    metastore_id = "12345678-1234-1234-1234-123456789012"
    workspace_id = 100001
  }

  # Example 2: Assign metastore to workspace (prod environment)
  workspace-prod-assignment = {
    enabled = true

    metastore_id = "87654321-4321-4321-4321-210987654321"
    workspace_id = 200001
  }

  # Example 3: Assign metastore to workspace (staging environment)
  workspace-staging-assignment = {
    enabled = true

    metastore_id = "11111111-2222-3333-4444-555555555555"
    workspace_id = 150001
  }

  # Example 4: Assign metastore to workspace (test environment)
  workspace-test-assignment = {
    enabled = true

    metastore_id = "99999999-8888-7777-6666-555544443333"
    workspace_id = 120001
  }

  # Example 5: Assign metastore to workspace (analytics)
  workspace-analytics-assignment = {
    enabled = true

    metastore_id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
    workspace_id = 300001
  }

  # Example 6: Assign metastore to workspace (data-science)
  workspace-datascience-assignment = {
    enabled = true

    metastore_id = "ffffffff-eeee-dddd-cccc-bbbbbbbbbbbb"
    workspace_id = 250001
  }
}
