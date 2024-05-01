region = "us-east-2"
instance_count = 4
provide_ami = {
  "us-east-1" = "ami-0a1179631ec8933d7"
  "us-east-2" = "ami-080e449218d4434fa"
  "us-west-1" = "ami-0e0ece251c1638797"
  "us-west-2" = "ami-086f060214da77a16"
}
instance_type = [ "t3.micro", "t3.small", "t3.medium", "t3.large", "t3.xlarge" ]
subnet_id = "subnet-7cXXXXXX"
security_group_ids = ["sg-038XXXXXXXXXXXXXX291", "sg-a2XXXXXXca"]
name = "Jenkins-Master"
env = "Dev"
