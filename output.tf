output "vpc_id" {
 description = "vpcid"
 value = module.vpc.vpc_id
}

output "sg_id" {
 description= "security groupid"
 value = module.security_group.sg_id
}

output "ec2_id" {
 description = "ec2 instance id"
 value = module.ec2.ec2_id
}
