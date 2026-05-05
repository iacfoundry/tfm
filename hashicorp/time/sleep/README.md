
### sleep MODULE
## Updated 06/07/2024 13:11:45

# sleep_DATA.TFVARS EXAMPLE
```
sleep_data = {
  "sleep_1" = {
    enabled          = true
    create_duration  = "5m"
    destroy_duration = "10m"
    triggers = {
      key1 = "value1"
      key2 = "value2"
    }
  },
  "sleep_2" = {
    enabled          = true
    create_duration  = "15m"
    destroy_duration = "20m"
    triggers = {
      key3 = "value3"
      key4 = "value4"
    }
  }
}
```

# sleep MAIN.TF MODULE REFERENCE
```
module "sleep" {
        source = "./modules/time/sleep"

        sleep_data = var.sleep_data
}
```

# sleep ROOT VARIABLES.TF
```
variable "sleep_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    create_duration  = optional(string)
    destroy_duration = optional(string)
    triggers         = optional(map(string))
  }))
  default = {}
}
```
