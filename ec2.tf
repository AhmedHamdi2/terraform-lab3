resource "aws_instance" "ec2" {
  count         = length(var.list_ec2_configs)
  ami           = var.list_ec2_configs[count.index].ami
  instance_type = var.list_ec2_configs[count.index].ec2_tier
  subnet_id     = aws_subnet.subnets["Public-1"].id  

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips_inventory.txt"
    
  }

  tags = {
    Name = "${var.list_ec2_configs[count.index].name}-${terraform.workspace}"
    Env  = var.env
  }
}




