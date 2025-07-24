locals {
  project       = "imput-vars-locals-output"
  project_owner = "terraform course"
}

locals {
  common_tags = {
    project       = local.project
    project-owner = local.project_owner
  }
}