variable "region" {
  description = "Region of resources for AWS"
  type = string
}
variable "instance_count" {
  description = "Provide the Instance Count"
  type = number
}
variable "provide_ami" {
  description = "Provide the AMI ID for the EC2 Instance"
  type = map
}
variable "instance_type" {
  description = "Provide the Instance Type"
  type = list
}
variable "subnet_id" {
  description = "Provide the Subnet ID"
  type = string
}
variable "security_group_ids" {
  description = "Provide the security group"
  type = list
}
variable "name" {
  description = "Provide the name of the EC2 Instance"
  type = string
}
variable "env" {
  description = "Provide the Environment as dev, test or prod"
  type = string
}
