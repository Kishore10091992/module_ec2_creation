resource "aws_security_group" "main_sg" {
 vpc_id = var.vpc_id

 ingress {
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.protocol
  cidr_blocks = [var.default_ip]
 }

 egress {
  from_port = var.from_port
  to_port = var.to_port
  protocol = var.protocol
  cidr_blocks = [var.default_ip]
  }

  tags = var.tags
}
