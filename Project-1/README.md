# Deployment of two-tier Tomcat Application with EKS
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/80b104a8-ceae-4eac-91e3-efd7939c9d37)
<br> <br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f8a07e55-7069-412c-b9ae-834d95558eac)
<br><br/>
**The above shown diagram is high level architecture of the entire end-to-end setup, for CI/CD tool Jenkins and to create the application ArgoCD has been used. To check code quality SonarQube, to upload the artifacts Nexus and to scan the docker image trivy scan has been used.**
<br><br/>
**In Industry you will not get the chance to create Jenkins Master Server on a daily basis however you will frequently get the chance to create Jenkins Slave.**
<br><br/>
First of all launch four EC2 Instances, two EC2 Instances with t3.micro instance type (Jenkins Master and Jenkins Slave, here to save cost I am launching Jenkins Master with t3.micro) and two EC2 Instances with t3.medium (For SonarQube and Nexus) instance type. Install Terraform on Jenkins Slave Node and create EKS Cluster or you can create EKS Cluster using your Terraform Server and copy kubeconfig file on Jenkins Slave node.
<br><br/>
Launch two RDS one with PostgreSQL and another one with MySQL. The PostgreSQL RDS will be used for SonarQube and MySQL RDS will be used for two-tier Application deployment.
<br><br/>


