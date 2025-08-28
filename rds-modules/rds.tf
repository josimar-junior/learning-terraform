module "database" {
  source       = "./modules/rds"
  project_name = "rds-modules"
  credentials = {
    username = "db-admin"
    password = "abc1+?_"
  }
}