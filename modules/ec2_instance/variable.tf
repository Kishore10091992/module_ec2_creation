variable "ami_id" {
 description = "ec2 ami id"
 type = string
}

variable "instance_type" {
 description = "ec2 instance type"
 type = string
}

variable "key_name" {
 description = "ec2 keypair"
 type = string
}

variable "tags" {
 description = "ec2 tags"
 type = map(string)
}

variable "subnet_id" {
 description = "ec2 subnet id"
 type = string
}

variable "sg_id" {
 description = "ec2 security group id"
 type = string
}