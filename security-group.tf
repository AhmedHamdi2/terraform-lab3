# Create security groups for the bastion instances.
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.myVPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Lab2-Bastion-SG"
    env = var.env
  }
}


# Create security groups for the application instances.
resource "aws_security_group" "app_sg" {
  vpc_id = aws_vpc.myVPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myVPC.cidr_block]  
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myVPC.cidr_block]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Lab2-App-SG"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "rds-sg-${terraform.workspace}"
  description = "Allow internal access to RDS"
  vpc_id      = aws_vpc.myVPC.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]  # Only allow traffic from within the VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS-SG-${terraform.workspace}"
  }
}


resource "aws_security_group" "redis_sg" {
  name        = "redis-sg-${terraform.workspace}"
  description = "Allow internal access to Redis"
  vpc_id      = aws_vpc.myVPC.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]  # Only allow traffic from within the VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Redis-SG-${terraform.workspace}"
  }
}
