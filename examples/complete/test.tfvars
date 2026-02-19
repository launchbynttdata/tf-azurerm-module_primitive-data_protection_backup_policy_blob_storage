resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }

  storage_account = {
    name       = "st"
    max_length = 24
  }

  recovery_vault = {
    name       = "rsv"
    max_length = 50
  }
}

logical_product_family  = "launch"
logical_product_service = "backup"
class_env               = "test"
instance_env            = 0
instance_resource       = 0

# location = "eastus"

sku                           = "Standard"
public_network_access_enabled = true
immutability                  = "Disabled"
storage_mode_type             = "GeoRedundant"
cross_region_restore_enabled  = false
soft_delete_enabled           = true

tags = {
  environment = "test"
  terraform   = "true"
  purpose     = "backup-example"
}

file_share_name = "test-file"

backup_repeating_time_intervals = [
  "R/2024-01-01T02:00:00+00:00/P1D"
]

policy_name = "test"

operational_default_retention_duration = "P30D"
vault_default_retention_duration       = "P7D"
time_zone                              = "UTC"

timeouts = {
  create = "30m"
  read   = "5m"
  delete = "30m"
}
