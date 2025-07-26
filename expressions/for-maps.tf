locals {
  all_values  = { for key, value in var.numbers_map : key => "${key} - ${value}" }
  doubles_map = { for key, value in var.numbers_map : key => value * 2 }
}

output "all_values" {
  value = local.all_values
}

output "doubles_map" {
  value = local.doubles_map
}