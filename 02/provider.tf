terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "terraform-course-jj"
    key = "backends/state.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}