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

resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets["subnet_1"].subnet_id

  tags = {
    Name    = "local-modules"
    Project = "local-modules"
  }
}