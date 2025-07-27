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
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main[count.index].id

  tags = {
    project = local.project
    Name    = "ec2-${local.project}-${count.index}"
  }
}