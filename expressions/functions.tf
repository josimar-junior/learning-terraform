locals {
  name = "Josimar"
  age  = 15
}

output "upper_name" {
  value = upper(local.name)
}

output "pow_age" {
  value = pow(local.age, 2)
}

output "file_read" {
  value = file("${path.module}/users.yml")
}

output "yml_file_read" {
  value = yamldecode(file("${path.module}/users.yml")).users
}