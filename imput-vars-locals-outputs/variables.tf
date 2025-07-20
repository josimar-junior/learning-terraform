variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the managed EC2 instances"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro and t3.micro"
  }
}

variable "ec2_volume_config" {
  type = object({
    type = string
    size = number
  })
  default = {
    type = "gp2"
    size = 10
  }
  description = "The size and type of the root block volume for EC2 instances"
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

# variable "ec2_volume_size" {
#   type        = number
#   description = "The size in GB of the root block volume attached to manage EC2 instance"
# }

# variable "ec2_volume_type" {
#   type        = string
#   description = "The volume type between gp2 and gp3"
# }