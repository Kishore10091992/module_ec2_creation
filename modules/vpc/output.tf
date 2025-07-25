output "vpc_id" {
 description = "vpcid"
 value = aws_vpc.main_vpc.id
}

output "subnet_id" {
 description = "subnet id"
 value = aws_subnet.main_subnet.id
}

output "igw_id" {
 description = "internet gateway id"
 value = aws_internet_gateway.main_igw.id
}

output "rt_id" {
 description = "route table id"
 value = aws_route_table.main_rt_tb.id
}
