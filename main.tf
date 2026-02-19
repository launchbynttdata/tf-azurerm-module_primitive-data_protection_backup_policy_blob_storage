resource "azurerm_data_protection_backup_policy_blob_storage" "policy" {
  name     = var.policy_name
  vault_id = var.vault_id

  backup_repeating_time_intervals        = var.backup_repeating_time_intervals
  operational_default_retention_duration = var.operational_default_retention_duration
  vault_default_retention_duration       = var.vault_default_retention_duration
  time_zone                              = var.time_zone

  dynamic "retention_rule" {
    for_each = var.retention_rules

    content {
      name     = retention_rule.value.name
      priority = retention_rule.value.priority

      life_cycle {
        data_store_type = retention_rule.value.life_cycle.data_store_type
        duration        = retention_rule.value.life_cycle.duration
      }

      criteria {
        absolute_criteria      = lookup(retention_rule.value.criteria, "absolute_criteria", null)
        days_of_month          = lookup(retention_rule.value.criteria, "days_of_month", null)
        days_of_week           = lookup(retention_rule.value.criteria, "days_of_week", null)
        months_of_year         = lookup(retention_rule.value.criteria, "months_of_year", null)
        scheduled_backup_times = lookup(retention_rule.value.criteria, "scheduled_backup_times", null)
        weeks_of_month         = lookup(retention_rule.value.criteria, "weeks_of_month", null)
      }
    }
  }

  timeouts {
    create = var.timeouts.create
    read   = var.timeouts.read
    delete = var.timeouts.delete
  }
}
