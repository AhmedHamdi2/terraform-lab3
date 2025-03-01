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


