resource "aws_instance" "ec2" {
  ami           = var.provide_ami
  instance_type = var.instance_type
  monitoring = true
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id
  root_block_device{
    volume_type="gp2"
    volume_size="20"
    encrypted=true
    kms_key_id="arn:aws:kms:us-east-2:027XXXXXXXXX06:key/d3XXXXXXc3-9XX4-4XX4-bXXb-87XXXXXXXXX619"
    delete_on_termination=true
  }
  user_data=<<EOF
                 #!/bin/bash
                 /usr/sbin/useradd -s /bin/bash -m ritesh;
                 mkdir /home/ritesh/.ssh;
                 chmod -R 700 /home/ritesh;
                 echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqGi/09OOP0hntUidvqDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXvBNX72uaNJvUWnNsefytn6Xenads2O7eQm7o0kNoXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXjZLBi1BYuXFksx5yfPZCAcZmkUSSyfRSl7JQe2BxQYzzlnuJ/C/UpMnrhwxIgfaSXKtaa5U2uoDbCj+VxfQntOeXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKUFD8nB5BZhPt+gBN0WiMqVWHN3Dj4WdCbXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXr5Ta/RlR6XXXXXXXXXX= ritesh@DESKTOP-XXXXXXXXXXF" >> /home/ritesh/.ssh/authorized_keys;
                 chmod 600 /home/ritesh/.ssh/authorized_keys;
                 chown ritesh:ritesh /home/ritesh/.ssh -R;
                 echo "ritesh  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ritesh;
                 chmod 440 /etc/sudoers.d/ritesh; 
             EOF
  lifecycle{
    prevent_destroy=false
    ignore_changes=[ ami ]
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  metadata_options { #Enabling IMDSv2
    http_endpoint = "enabled"
    http_tokens   = "required"
    http_put_response_hop_limit = 2
  }

  tags={
    Name=var.name
    Environment = var.env
  }
}
resource "aws_eip" "eip_associate" {
  domain = "vpc"     ###vpc = true
} 
resource "aws_eip_association" "eip_association" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.eip_associate.id
}
