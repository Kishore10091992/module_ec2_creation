resource "aws_instance" "main_ec2" {
 ami = var.ami_id
 instance_type = var.instance_type
 key_name = var.key_pair
 tags = var.tags
}
