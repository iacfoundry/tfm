### MWS_PERMISSION_ASSIGNMENT MODULE
## Updated 05/15/2024 17:10:21

# MWS_PERMISSION_ASSIGNMENT_DATA.TFVARS EXAMPLE
```
mws_permission_assignment_data = {
  "example_assignment_1" = {
    enabled      = true
    workspace_id = "example-workspace-id-1"
    principal_id = "example-principal-id-1"
    permissions  = ["USER", "ADMIN"]
  },
  "example_assignment_2" = {
    enabled      = true
    workspace_id = "example-workspace-id-2"
    principal_id = "example-principal-id-2"
    permissions  = ["USER"]
  }
}

```

# MWS_PERMISSION_ASSIGNMENT MAIN.TF MODULE REFERENCE
```
module "mws_permission_assignment" {
        source = "./modules/databricks/mws_permission_assignment"

        mws_permission_assignment_data = var.mws_permission_assignment
}
```

# MWS_PERMISSION_ASSIGNMENT ROOT VARIABLES.TF
```
variable "mws_permission_assignment_data" {
  type = map(object({
    # Required
    enabled      = bool
    workspace_id = string
    principal_id = string
    permissions  = list(string)

  }))
  default = {}
}
```
