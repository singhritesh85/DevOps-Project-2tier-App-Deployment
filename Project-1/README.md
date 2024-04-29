# Deployment of two-tier Tomcat Application with EKS
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/80b104a8-ceae-4eac-91e3-efd7939c9d37)
<br> <br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/20d91517-bf28-4038-b1da-8baaf11387c2)
<br><br/>
**The above shown diagram is high level architecture of the entire end-to-end setup, for CI/CD tool Jenkins and to create the application ArgoCD has been used. To check code quality SonarQube, to upload the artifacts Nexus and to scan the docker image trivy scan has been used.**
<br><br/>
**In Industry you will not get the chance to create Jenkins Master Server on a daily basis however you will frequently get the chance to create Jenkins Slave.**
<br><br/>
First of all launch two EC2 Instances
