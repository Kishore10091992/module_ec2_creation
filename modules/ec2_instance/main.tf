resource "aws_instance" "main_ec2" {
 ami = var.ami_id
 instance_type = var.instance_type
 subnet_id = var.subnet_id
 security_groups = [var.sg_id]
 associate_public_ip_address = true
 key_name = var.key_name
 tags = var.tags
}
