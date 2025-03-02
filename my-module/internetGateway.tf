resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "Lab2-IGW"
  }
}


