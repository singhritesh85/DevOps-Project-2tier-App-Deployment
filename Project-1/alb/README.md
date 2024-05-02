# Create Application Load Balancer
**Create Application Load Balancer for Jenkins, SonarQube and Nexus**
<br><br/>
```
1. To create ALB for Jenkins set instance_port as 8080, healthcheck_path as /login and appropriate value of ec2_instance_id.
2. To create ALB for SonarQube set instance_port as 9000, healthcheck_path as / and appropriate value of ec2_instance_id.
3. To create ALB for Nexus set instance_port as 8081, healthcheck_path as / and appropriate value of ec2_instance_id.
4. First of all create ALB for Jenkins and here create s3 bucket as well along with the ALB.
5. Then create ALB for SonarQube and Nexus. While creating ALB for SonarQube and Nexus keep the option s3_bucket_exists as true, it will not create any new s3 bucket just use the existing s3 bucket to capture ALB access logs. 
```
<br><br/>
**Provide bucket policy in file bucket-policy.json as shown below**
<br><br/>
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::elb-account-id:root"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::s3bucketcapturealblog/application_loadbalancer_log_folder/AWSLogs/aws-account-id/*"
    }
  ]
}




Provide AWS Account ID instead of aws-account-id.
Provide ELB Account ID instead of elb-account-id

Replace elb-account-id for US East (Ohio) region with 033677994240.
```
