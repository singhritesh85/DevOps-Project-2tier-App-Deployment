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
<br><br/>
Reboot the EC2 Instances for changes to take effect.
<br><br/>
Now you will not face this issue again.
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/6a7936d0-8dca-49ee-b783-cfa79a74d104)
<br><br/>
**Another way to resolve this issue**
<br><br/>
You can add nameserver 8.8.8.8 in your /etc/resolv.conf file but when you reboot you EC2 Instance then these changes will not be reflected in your EC2 Instance. To bring these changes in effect even after you rebooted your EC2 Instance add the entry **supersede domain-name-servers 8.8.8.8;** in file **/etc/dhcp/dhclient.conf**.
<br><br/>
If you are getting notification in Nexus regarding File Descriptors then first of all stop the nexus service as /opt/nexus/bin/nexus stop then start nexus as a service using sudo systemctl start nexus && sudo systemctl enable nexus && sudo systemctl status nexus. I had discussed how to create nexus as a service at the time of it's installation in Project-1. Then again start nexus using /opt/nexus/bin/nexus start and check it's status using /opt/nexus/bin/nexus status.
<br><br/>
