# Deployment of two-tier Tomcat Application with EKS
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/80b104a8-ceae-4eac-91e3-efd7939c9d37)
<br> <br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/7f912cb2-8788-4977-882c-050b72fcdc66)
<br><br/>
**The above shown diagram is high level architecture of the entire end-to-end setup, for CI/CD tool Jenkins and to create the application ArgoCD has been used. To check code quality SonarQube, to upload the artifacts Nexus and to scan the docker image trivy scan has been used.**
<br><br/>
**In Industry you will not get the chance to create Jenkins Master Server on a daily basis however you will frequently get the chance to create Jenkins Slave.**
<br><br/>
First of all launch four EC2 Instances, two EC2 Instances with t3.micro instance type (Jenkins Master and Jenkins Slave, here to save cost I am launching Jenkins Master with t3.micro) and two EC2 Instances with t3.medium (For SonarQube and Nexus) instance type. Install Terraform on Jenkins Slave Node and create EKS Cluster or you can create EKS Cluster using your Terraform Server and copy kubeconfig file on Jenkins Slave node.
<br><br/>
Launch two RDS one with PostgreSQL and another one with MySQL. The PostgreSQL RDS will be used for SonarQube and MySQL RDS will be used for two-tier Application deployment.
<br><br/>
**Jenkins Installation**
<br><br/>
```
yum install -y java-17*
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo 
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
systemctl start jenkins && systemctl enable jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2563027e-81c7-4c00-aa7b-2704ced715cc)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/981e25ec-3dfa-4336-a4a8-75ea95a6f89a)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/beabbcee-e9e3-4042-8054-49163ca429f5)
<br><br/>
**Configure Slave Node for Jenkins**
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/601c5915-445b-4ffb-ae83-bad32651dcd2)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/402ab71b-3abe-43f1-9adc-5aade5cd3c89)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2a6b63c9-2519-4cc4-9e65-53964634dc22)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f8444285-cd39-49aa-80d9-17d4aaa2f38c)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f20c0db8-6de6-4914-856c-4f7f1755c959)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5e2ed699-6391-4cb0-80e0-bfd5dfab5b0d)
<br><br/>
Install Java 17 using the command yum install java-17* -y
<br><br/>
**Install Plugins for Jenkins and Configure SonarQube and Email Notification in Jenkins**
<br><br/>
Install 1. Nexus Artifact Uploader 2. SonarQube Scanner for Jenkins and 3. Pipeline Utility Steps plugins
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/4b19340f-6c41-4d32-a687-a26f98d632b6)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/cfb69072-ce69-426a-9069-11d25f36e85f)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/17be57f9-50e5-418e-9980-926d5a71c839)
<br><br/>
**Configure SonarQube Scanner**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/59d7a00d-36fe-409b-8440-ea308b4d274d)
<br><br/>
**Configure Email Notification in Jenkins**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2403ca74-560d-4324-b91b-141f1b6a66f2)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/7099dc06-d301-4232-a299-340931fa6357)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/874ac72d-0535-4033-8a72-3b7b547c7705)
**Passwords for Jenkins**
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e591f93e-ff84-4489-8ee8-4668f5286c5f)



