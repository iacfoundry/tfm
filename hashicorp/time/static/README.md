
### static MODULE
## Updated 06/07/2024 13:11:45

# static_DATA.TFVARS EXAMPLE
```
static_data = {
  "static_1" = {
    enabled  = true
    rfc3339  = "2024-05-20T00:00:00Z"
    triggers = {
      key1 = "value1"
      key2 = "value2"
    }
  },
  "static_2" = {
    enabled  = true
    rfc3339  = "2024-12-31T23:59:59Z"
    triggers = {
      key3 = "value3"
      key4 = "value4"
    }
  }
}
```

# static MAIN.TF MODULE REFERENCE
```
module "static" {
        source = "./modules/time/static"

        static_data = var.static_data
}
```

# static ROOT VARIABLES.TF
```
variable "static_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    rfc3339  = optional(string)
    triggers = optional(map(any))
  }))
  default = {}
}
```