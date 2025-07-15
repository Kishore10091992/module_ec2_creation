terraform {
 required_providers {
  aws = {
   source = "hashicorp/aws"
   version = "~>5.0"
  }
 }
}

provider "aws" {
 region = var.aws_region
}

module "vpc" {
 source = "./modules/vpc"
 vpc_cidr = "172.168.0.0/16"
 subnet_cidr = "172.168.0.0/24"
 availability_zone = "us-east-1a"
 route_cidr = "0.0.0.0/0"

 tags = {
  Name = "module_vpc"
 }
}

module "security_group" {
 source = "./modules/security_group"
 vpc_id = module.vpc.vpc_id
 ingress {
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_block = "0.0.0.0/0"
 }

 egress {
  from_port = 0
  to_port = 0
  protocol = 0
  cidr_block = 0
 }

 tags = {
  Name = "module_sg"
 }
}

module "ec2" {
 source = "./modules/ec2"
 data "aws_ami" "ec2_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
   name = "name"
   values = ["amzn2-ami-hvm-*]
  }
 }

 resource "tls_private_key" "generate_key" {
  algorithm = "RSA"
  rsa_bits = 4096
 }
 resource "aws_key_pair" "main_key" {
  key_name = "main_key"
  public_key = tls_private_key.generate_key.public_key_openssh

  tags = {
   Name = "modulw_keypair"
  }
 }

 ami = data.aws_ami.ec2_ami.id
 instance_type = "t2.micro"
 key_name = aws_key_pair.main_key.key_name

 tags = {
  Name = "module-ec2"
 }
}
