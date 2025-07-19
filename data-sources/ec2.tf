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

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "prod_vpc" {
  tags = {
    Env = "Prod"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_iam_policy_document" "static_website" {
  statement {
    sid = "PublicReadGetObject"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = ["arn:aws:s3:::*/*"]
  }
}

output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu.id
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

output "aws_vpc" {
  value = data.aws_vpc.prod_vpc.id
}

output "azs" {
  value = data.aws_availability_zones.available.names
}

output "iam_policy" {
  value = data.aws_iam_policy_document.static_website.json
}

resource "aws_instance" "instance" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
}