module "ec2_demo" {
source = "../module"
count = var.instance_count
provide_ami = var.provide_ami["us-east-2"]
instance_type = var.instance_type[2]
security_group_ids = var.security_group_ids
subnet_id = var.subnet_id
name = var.name               # name="${var.name}-${count.index + 1}"

env = var.env
}
