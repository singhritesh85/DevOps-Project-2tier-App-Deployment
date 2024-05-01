# terraform-ec2
```
1. First of all clone this repository and change the directory to "ec2_with_count".
2. you can use this terraform script to launch an EC2 Instance. If you are creating four EC2 Instances with the name Jenkins-Master, Jenkins-Slave, SonarQube-Server and Nexus-Server using this terraform script then change the name in terraform.tfvars file as per your requirement and change the backend.tf file's "key" to ec2/Jenkins-Master/dev/terraform.tfstate, ec2/Jenkins-Slave/dev/terraform.tfstate, ec2/SonarQube-Server/dev/terraform.tfstate and ec2/Nexus-Server/dev/terraform.tfstate. For this approach you should keep count = 1.
3. After creation of first instance you will change the backend.tf. Always run the command terraform init -reconfigure when you do changes in backend.tf 
4. Finally run terraform apply -auto-approve
```


**Another approach**
<br><br/>
```
1. First of all clone this repository and change the directory to "ec2_with_count".
2. Use count = 4 and launch four EC2 Instances with instance_type "t3.medium", after launching these four EC2 Instances go to AWS Console and change the name of these EC2 Instances as Jenkins-Master, Jenkins-Slave, SonarQube-Server and Nexus-Server. Stop Instances named as Jenkins-Master and Jenkins-Slave and do the changes in instance_type as t3.micro. Then start these two stopped EC2 Instances Jenkins-Master and Jenkins-Slave. Now from terminal run the command terraform refresh and then terraform show. The changes which you did from AWS Console will be reflected in state file as well now.
3. Run terraform init
4. Finally Run terraform apply -auto-approve
```

<br><br/>
Steps to use terraform command
<br><br/>
```
1. terraform init         ### Initialize working directory
2. terraform validate     ### check the syntax of terraform script
3. terraform plan         ### chech what are the resources which terraform will create
4. terraform apply  or terraform apply -auto-approve  ### create resource using terraform
```
