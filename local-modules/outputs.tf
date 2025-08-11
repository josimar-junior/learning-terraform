output "module_vpc_id" {
  value = module.vpc.vpc_id
}

output "module_output_public_subnets" {
  value = module.vpc.output_public_subnets
}

output "module_output_private_subnets" {
  value = module.vpc.output_private_subnets
}