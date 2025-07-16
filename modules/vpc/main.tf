resource "aws_vpc" "main_vpc" {
 cidr_block = var.vpc_cidr
 tags = var.tags
}

resource "aws_subnet" "main_subnet" {
 vpc_id = aws_vpc.main_vpc.id
 cidr_block = var.subnet_cidr
 availability_zone = var.availability_zone
 tags = var.tags
}

resource "aws_internet_gateway" "main_igw" {
 vpc_id = aws_vpc.main_vpc.id
 tags = var.tags
}

resource "aws_route_table" "main_rt_tb" {
 vpc_id = aws_vpc.main_vpc.id

 route {
  cidr_block = var.default_ip
  gateway_id = aws_internet_gateway.main_igw.id
 }

 tags = var.tags
}

resource "aws_route_table_association" "main_rt_tb_ass" {
 subnet_id = aws_subnet.main_subnet.id
 route_table_id = aws_route_table.main_rt_tb.id
}