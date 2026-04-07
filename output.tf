/*
This file is used to output the public IP, public DNS and private IP of the EC2 instance created using Terraform.
[*] this used for counting the number of instances created and outputting the values in a list format.
to output multiple instances with key and value pair use for loop in output block and interpolation of ec2.tf file

output "ec2_instance_public_ip" {
    value = aws_instance.my_instance[*].public_ip
    description = "Public IP address of the EC2 instance"
  
}   

output "ec2_instance_dns" {
    value = aws_instance.my_instance[*].public_dns   # interpolation of ec2.tf file  
    description = "Public DNS of the EC2 instance"
  
}

output "ec2_instance_private_ip" {
    value = aws_instance.my_instance[*].private_ip
    description = "Private IP address of the EC2 instance"
  
}
/* to output multiple instances use splat operator [*] and interpolation of ec2.tf file */

output "ec2_instance_public_ip" {
    value = {
        for key, instance in aws_instance.my_instance :
        key => instance.public_ip
    }
}
output "ec2_instance_dns" {
    value = {
        for key, instance in aws_instance.my_instance :
        key => instance.public_dns
    }
}
output "ec2_instance_private_ip" {
  value = {
    for key, instance in aws_instance.my_instance :
    key => instance.private_ip
  }
}
# for_each loop is used to output multiple instances with key and value pair