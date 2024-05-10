**Discussing about some issues which you may face**
<br><br/>
After creation of SonarQube-Server, Nexus-Server, Jenkins-Master and Jenkins-Slave you will face the issue that you are unable to telnet or netcat the Jenkins-Master, Nexus or SonarQube URL which you created using Route53 record set from the any of the EC2 Instance. If you face this issue then check the /etc/resolv.conf file. 
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/8d193f07-118f-419a-b6e8-d03a9e1e5b7e)
<br><br/>
If you face the issue as discussed above then check the entry of /etc/resolv.conf file and if it is as shown above then please do the below changes.
<br><br/>
Either change your /etc/resolv.conf file or create a DHCP Option Set with your domain name and google public DNS Server 8.8.8.8 as shown below. My suggestion is to create a DHCP Option set and attach it to your VPC which you have used for creation of SonarQube-Server, Nexus-Server, Jenkins-Master and Jenkins-Slave. You can refer below screenshot.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/49f68a4a-260a-4f03-8f6d-45d633f51c21)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/7ae45022-e5c2-47d5-b222-37b4ed37ff22)

