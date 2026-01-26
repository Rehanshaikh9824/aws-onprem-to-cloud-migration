variable "region" {
  type        = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "create_ec2" {
  type    = bool
  default = true
}
