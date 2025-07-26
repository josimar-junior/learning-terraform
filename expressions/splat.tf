locals {
  firstnames_from_splat = var.object_list[*].firstname
  roles_from_splat      = values(local.user_maps_roles)[*].roles
}

output "firstnames_from_splat" {
  value = local.firstnames_from_splat
}

output "roles_from_splat" {
  value = local.roles_from_splat
}