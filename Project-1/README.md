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
**Install Plugins for Jenkins and Configure SonarQube and Email Notification in Jenkins**
<br><br/>
