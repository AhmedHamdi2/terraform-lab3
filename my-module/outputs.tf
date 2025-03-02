# This file contains the output variables for the module to be used in the root module.
output subnets {
    value = aws_subnet.subnets
    description = "The subnets created"
     
}

output "app_sg" {
    value = aws_security_group.app_sg.id
    description = "The security group created"
  
}

output "bastion_sg" {
    value = aws_security_group.bastion_sg.id
    description = "The security group created"
  
}