locals {
  users = yamldecode(file("${path.module}/users-roles.yml")).users
}

output "users" {
  value = local.users
}