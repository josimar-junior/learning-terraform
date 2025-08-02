locals {
  users = yamldecode(file("${path.module}/users-roles.yml")).users
  users_map = {
    for user_config in local.users : user_config.username => user_config.roles
  }
}