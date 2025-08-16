locals {
  allowed_instance_types = ["t2.micro", "t3.micro"]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Owner is a Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    CostCenter = "12345"
  }

  lifecycle {
    precondition {
      condition     = contains(local.allowed_instance_types, var.instance_type)
      error_message = "Invalid instance type"
    }
  }
}

check "cost_center_check" {
  assert {
    condition     = can(aws_instance.main.tags.CostCenter != "")
    error_message = "Your AWS instance does not have a CostCenter tag."
  }
}