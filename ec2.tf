# resource "aws_instance" "ec2" {
#   count         = length(var.list_ec2_configs)
#   ami           = var.list_ec2_configs[count.index].ami
#   instance_type = var.list_ec2_configs[count.index].ec2_tier
#   subnet_id     = module.network.subnets["Public-1"].id
#   vpc_security_group_ids = [module.network.security_group]  

#   provisioner "local-exec" {
#     command = "echo ${self.public_ip} >> public_ips_inventory.txt"
    
#   }

#   tags = {
#     Name = "${var.list_ec2_configs[count.index].name}-${terraform.workspace}"
#     Env  = var.env
#   }
# }


# Create a bastion host
resource "aws_instance" "bastion-host" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.network.subnets["Public-1"].id
  vpc_security_group_ids = [module.network.bastion_sg]
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips_inventory.txt"
    
  }
  
}


# Create an application server
resource "aws_instance" "app-server" {
  count                  = var.app_count
  ami                    = var.list_ec2_configs[count.index].ami
  instance_type          = var.list_ec2_configs[count.index].ec2_tier
  subnet_id              = module.network.subnets["Private-1"].id
  vpc_security_group_ids = [module.network.app_sg]
  
}



