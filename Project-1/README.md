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
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/09b7f893-2878-4952-8f80-978a23cbc871)
<br><br/>
**Configure Slave Node for Jenkins**
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/601c5915-445b-4ffb-ae83-bad32651dcd2)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/402ab71b-3abe-43f1-9adc-5aade5cd3c89)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2a6b63c9-2519-4cc4-9e65-53964634dc22)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f8444285-cd39-49aa-80d9-17d4aaa2f38c)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f20c0db8-6de6-4914-856c-4f7f1755c959)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5e2ed699-6391-4cb0-80e0-bfd5dfab5b0d)
<br><br/>
Install Java 17 
Install Docker and start Docker Service 
download maven binary and unarchive it
Install trivy
```
yum install -y java-17*

yum install -y docker -y && systemctl start docker && systemctl enable docker
usermod -G docker jenkins

wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xvf apache-maven-3.9.6-bin.tar.gz
mv apache-maven-3.9.6/ apache-maven

curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.38.3
```
<br><br/>
**Configure Sendmail with SES on Jenkins Slave Node**
```
yum install -y sendmail sendmail-cf m4
vim /etc/mail/authinfo

AuthInfo:email-smtp.us-east-2.amazonaws.com "U:root" "I:AKIXXXXXXXXXF75XXXZC" "P:BCXXXXXXXlaYBAXXXxxxxXXXNEzxGXXxxXXcfPa" "M:PLAIN"


sudo sh -c 'makemap hash /etc/mail/authinfo.db < /etc/mail/authinfo'
sh -c 'echo "Connect:email-smtp.us-east-2.amazonaws.com RELAY" /etc/mail/access'
sh -c 'makemap hash /etc/mail/access.db < /etc/mail/access'
sudo sh -c 'cp /etc/mail/sendmail.cf /etc/mail/sendmail_cf.backup && cp /etc/mail/sendmail.mc /etc/mail/sendmail_mc.backup'




Add the lines below to the /etc/mail/sendmail.mc file before any MAILER() declarations

vim /etc/mail/sendmail.mc

define(`SMART_HOST', `email-smtp.us-east-2.amazonaws.com')dnl
define(`RELAY_MAILER_ARGS', `TCP $h 587')dnl
define(`confAUTH_MECHANISMS', `EXTERNAL GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
FEATURE(`authinfo', `hash -o /etc/mail/authinfo.db')dnl
MASQUERADE_AS(`singhritesh85.com')dnl
FEATURE(masquerade_envelope)dnl
FEATURE(masquerade_entire_domain)dnl

sudo chmod 666 /etc/mail/sendmail.cf
sh -c 'm4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf'
sudo chmod 644 /etc/mail/sendmail.cf
systemctl restart sendmail
/usr/sbin/sendmail -f abc@singhritesh85.com rksgoal@gmail.com

yum install -y mailx


vim /var/log/maillog   ====================>   To see the mail log.
```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/01bd5c2d-ddf0-4152-970c-4694167b31c5)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b7b85226-2ed0-4335-8a07-52452890e089)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b9acc6d9-282f-442d-8d49-3a72d5e43c3a)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/a83333fb-5e27-4021-9bd9-b3c3460eae6a)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/c519c4d3-c5cb-406b-bbf1-3fdbfb70ade5)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0fb17036-b0d8-4076-9c48-25da38c98fa5)

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
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b2082d7a-e566-4b18-8f76-aef23957a989)
<br><br/>
**Configure Email Notification in Jenkins**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2403ca74-560d-4324-b91b-141f1b6a66f2)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/7099dc06-d301-4232-a299-340931fa6357)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/874ac72d-0535-4033-8a72-3b7b547c7705)
**Passwords for Jenkins**
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e591f93e-ff84-4489-8ee8-4668f5286c5f)

**SonarQube Installation**
```
1. Install Java using the command yum install -y java-17*
2. Download binary for SonarQube and unarchive it, then do the further configuration as shown in the screenshots below

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.5.90363.zip
unzip sonarqube-9.9.5.90363.zip
mv sonarqube-9.9.5.90363/ sonarqube

```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5aeec7fb-5199-4777-a9d7-66433602d6e4)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0b7ed251-74b8-41d2-b886-6582f4e49850)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/4f049def-256f-4816-bd0c-0b2bae1c176f)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/25d52c66-912a-4a16-a53d-4e8036c737ae)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/bf31778a-882d-45e8-851b-d54f2cf84774)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b3c0710d-a070-4b84-96e8-fb04746c8c78)
<br><br/>
**Nexus Installation**
<br><br/>
```
Install java 1.8
download binary for Nexus and unarchive it.
create a user who will administer nexus and change the run_as_user option in nexus.rc file

yum install -y java-1.8*
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.67.1-01-java8-unix.tar.gz
tar -xvf nexus-3.67.1-01-java8-unix.tar.gz
mv nexus-3.67.1-01 nexus
useradd -s /bin/bash -m nexus
passwd nexus

# Provide sudo privilege to nexus 
visudo

### Allow root to run any commands anywhere
root    ALL=(ALL)        ALL
nexus   ALL=(ALL)        NOPASSWD:ALL

chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype

cd /opt/nexus/bin/
ls
vim /opt/nexus/bin/nexus.rc
run_as_user="nexus"

./nexus start
./nexus status

#Run nexus as a service
vim /etc/systemd/system/nexus.service

[Unit]
Description=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/etc/init.d/nexus start
ExecStop=/etc/init.d/nexus stop 
User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target


sudo systemctl start nexus.service
sudo systemctl enable nexus.service
```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/718ab425-78a2-4318-85ef-7b264f51ea9a)

<br><br/>
Create two repositories in nexus with the name maven-release and maven-snapshot. 
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/422150d3-8751-49ee-bb85-616d1730aee3)


