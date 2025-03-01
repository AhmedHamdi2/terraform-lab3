# output "bastion_public_ip" {
#   description = "Public IP of the Bastion Host"
#   value = aws_instance.ec2.name==
# }

# output "app_private_ip" {
#   description = "Private IP of the Application Server"
#   value       = aws_instance.app_server.private_ip
# }

# output "vpc_id" {
#   description = "VPC ID"
#   value       = aws_vpc.myVPC.id
# }

# output "bastion_public_ip" {
#   description = "Public IP of the Bastion Host"
#   value       = [for instance in aws_instance.ec2 : instance.public_ip if instance.tags["Name"] == "Bastion-1-${terraform.workspace}"]
# }

