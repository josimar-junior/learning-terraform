locals {
  user_maps = { for user in var.users : user.username => user.role... }
  user_maps_roles = {
    for username, roles in local.user_maps : username => { roles = roles }
  }
  usernames_from_map = [for username, roles in local.user_maps : username]
}

output "user_maps" {
  value = local.user_maps
}

output "user_maps_roles" {
  value = local.user_maps_roles
}

output "joao_roles" {
  value = local.user_maps_roles["joao"].roles
}

output "usernames_from_map" {
  value = local.usernames_from_map
}