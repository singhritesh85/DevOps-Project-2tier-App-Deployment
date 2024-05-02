############################## Provide Parameters for Application Load Balancer #####################################

region = "us-east-2"
application_loadbalancer_name = "jenkins-ms"
internal = false
load_balancer_type = "application"
subnets = ["subnet-7cXXXXXX07", "subnet-c9XXXXXXX84", "subnet-adXXXXXXXc5"]
security_groups = ["sg-03XXXXXXXXXXXXX91", "sg-a2XXXXXXca"]  ## Security groups are not supported for network load balancer
enable_deletion_protection = false
s3_bucket_exists = false   ### Select between true and false. It true is selected then it will not create the s3 bucket. 
access_log_bucket = "s3bucketcapturealblog"  ### S3 Bucket into which the Access Log will be captured
prefix = "application_loadbalancer_log_folder"
idle_timeout = 60
enabled = true
target_group_name = "jenkins"
instance_port = 8080
instance_protocol = "HTTP"          #####Don't use protocol when target type is lambda
target_type_alb = ["instance", "ip", "lambda"]
vpc_id = "vpc-0aXXXXXXX62"
ec2_instance_id = ["i-0cXXXXXXXXXXXX54"]
load_balancing_algorithm_type = ["round_robin", "least_outstanding_requests"]
healthy_threshold = 2
unhealthy_threshold = 2
timeout = 3
interval = 30
healthcheck_path = "/login"
ssl_policy = ["ELBSecurityPolicy-2016-08", "ELBSecurityPolicy-TLS-1-2-2017-01", "ELBSecurityPolicy-TLS-1-1-2017-01", "ELBSecurityPolicy-TLS-1-2-Ext-2018-06", "ELBSecurityPolicy-FS-2018-06", "ELBSecurityPolicy-2015-05"]
certificate_arn = "arn:aws:acm:us-east-2:02XXXXXXXXXXXX06:certificate/38XXXXXX91-aXXf-4XXa-8XXa-ddXXXXXXXX47"
type = ["forward", "redirect", "fixed-response"]

env = ["dev", "stage", "prod"]
