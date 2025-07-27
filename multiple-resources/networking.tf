resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    project = local.project
    Name    = "vpc-${local.project}"
  }
}

resource "aws_subnet" "main" {
  count      = var.subnet_count
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    project = local.project
    Name    = "${local.project}-${count.index}"
  }
}