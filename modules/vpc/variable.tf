variable "vpc_cidr" {
 description = "cidr for vpc"
 type = string
}

variable "subnet_cidr" {
 description = "cidr for subnet"
 type = string
}

variable "availability_zone" {
 type = string
 description = "availability zone for subnet"
}

variable "default_ip" {
 description = "default ip"
 type = string
}

variable "tags" {
 description = "common tags for all resources"
 type = map (string)
}