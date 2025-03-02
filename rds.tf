resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [for subnet in aws_subnet.subnets : subnet.id if try(subnet.tags["Type"], "") == "private"]



  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_db_instance" "rds_mysql" {
  identifier           = "rds-mysql-${terraform.workspace}"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  engine_version      = "8.0"
  username           = "admin"
  password           = "Terraform@123"  # Change or store in AWS Secrets Manager
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name = "RDS-MySQL-${terraform.workspace}"
  }
}


