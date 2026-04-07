variable "ec2_instance_type" {
    default = "t3.micro"
    type = string
}

variable "ec2-ami" {
    default = "ami-05d2d839d4f73aafb"
    type = string
}

variable "root_volume_size" {
    default = 10
    type = number
}