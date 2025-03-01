resource "aws_vpc" "myVPC" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Lab2-VPC"
  }
}

