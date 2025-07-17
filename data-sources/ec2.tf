data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Owner is a Canonical

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*" ]
  }

  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
}

output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_instance" "instance" {
  ami = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type = "t2.micro"
}