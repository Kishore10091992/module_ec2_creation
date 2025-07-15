variable "default_ip" {
 description = "default ip for sg"
 type = string
}

variable "from_port" {
 descrition = "from port for sg"
 type = number
}

variable "to_port" {
 description = "to port for sg"
 type = number
}

variable "protocol" {
 description = "protocol for sg"
  type = string
}

variable "vpc_id" {
 description = "vpc id"
 type = string
}

variable "tags" {
 description = "tags for sg"
 type = map(string)
}
