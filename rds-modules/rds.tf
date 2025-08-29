module "database" {
  source             = "./modules/rds"
  project_name       = "rds-modules"
  security_group_ids = []
  subnet_ids         = [aws_subnet.allowed.id]
  credentials = {
    username = "db-admin"
    password = "abc1+?_"
  }
}