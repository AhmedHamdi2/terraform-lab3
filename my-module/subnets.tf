resource "aws_subnet" "subnets" {
    for_each = { for subnet in var.subnet_list : subnet.name => subnet }
    vpc_id                  = aws_vpc.myVPC.id
    cidr_block              = each.value.cidr
    map_public_ip_on_launch = each.value.type== "public" ? true : false

      tags = {
    Name = each.key
    Type = each.value.type 
}
}





