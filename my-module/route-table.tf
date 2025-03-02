# Create a route table and route for the public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myVPC.id

}


# Create a route for the public subnet
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.lab_igw.id
}


# Associate the first public subnet with the public route table
resource "aws_route_table_association" "public_assoc" {
  for_each       = { for subnet in var.subnet_list : subnet.name => subnet if subnet.type == "public" }
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.public_rt.id
}


# Create a route table and route for the private subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "Lab2-Private-RT"
  }
}


# Associate the first private subnet with the private route table
resource "aws_route_table_association" "private_assoc" {
  for_each       = { for subnet in var.subnet_list : subnet.name => subnet if subnet.type == "private" }
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.private_rt.id
}



