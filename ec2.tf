#key pair login

resource "aws_key_pair" "tf-key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

# vpc and security group
resource "aws_default_vpc" "default" {
  
} 

# security group
resource "aws_security_group" "new_security_group" {
  name        = "auto-sg"
  description = "the Security group"
  vpc_id      = aws_default_vpc.default.id # interpolation

  # inbound rules
  ingress {
    from_port  = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }
  ingress {
    from_port = 80
    to_port   = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }
  ingress {
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "flask open"
  }
  # outbound rules
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open"
  }
  tags = {
    name = "auto-sg"
  }
}

# ec2 create
resource "aws_instance" "my_instance" {
  for_each = tomap({
    terraform_ec2_1 = "t3.micro"
    terraform_ec2_2 = "t3.micro"
  }) # to create multiple instances use for_each meta-argument
  key_name = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = [aws_security_group.new_security_group.id]
  instance_type = each.value  # var.ec2_instance_type(variable) or each.value(for_each)
  ami = var.ec2-ami
  subnet_id  = "subnet-0d4dd501829f34131"
  user_data = file("nginx_install.sh")

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"

  }
  tags = {
  Name = each.key # to assign unique name to each instance using for_each loop
}
}