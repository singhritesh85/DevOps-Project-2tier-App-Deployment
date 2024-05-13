#### Follow below rules to maintain security
```
1. This is a thumb rule, while working in Industry use private respository for Project. 
2. Whenever you launch an EC2 Instance use firewalld or iptables (or other firewall as required for your project).
3. Open those ports in Security Group which is required. Don't open all the ports, open only those ports which is required.
4. The port should be open to VPC CIDR and VPN IP for your organisation, this will be provided from the Organisation side. If any other port need to be open then you can open it afterwards. 
5. Use WAF infront of Application Load Balancer (ALB). ALB provides two level of security (Security Group is attached to ALB as well as to Target Group Instances behind the ALB).
6. You can use below AWS service to monitor Security and do updation if required like open security group to certain IPs instead of open it to entire world etc.
    AWS Trust Advisor
    AWS GuardDuty
    AWS Inspector 
```
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/af5d59f9-d001-4b28-935a-3c6416033a68)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/d0d8bfa7-261f-434a-b393-75ed0bec8b0a)
<br><br/>
Changed the SELINUX from Disabled to enforcing mode.
<br><br/>

![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/d275c683-3473-4f10-b45c-1c2660e8d69d)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/720a9c07-3caf-47ff-b49c-77ae3e19deee)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/92b4fb98-1623-4c5b-90c8-b3b34c0e7bc2)
<br><br/>
For SonarQube kept the SELINUX in permissive mode and install then configure the firewalld as shown in the screenshot below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/78f02104-bbb5-4b50-a1b3-ec299145ddad)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/5bedc119-02d4-4154-8fc9-93483e69e4bc)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/173be50e-b3e3-476d-9b37-d8e7b7708a41)
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/ee87ec88-d548-4e19-ba32-0febe97cedf7)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/00e5741a-97ab-449b-add2-4c4003adb4db)
<br><br/>
I had created both the RDS (MySQL and PostgreSQL) in one VPC and EKS in another VPC, established VPC peering between both the VPCs.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/6c9d31a9-d790-457d-b545-dd652aad7a05)

<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/6d611883-e289-4389-9235-89dc5160206e)

<br><br/>
For Nexus kept the SELINUX is enforcing mode and install then configure the firewalld as shown in the screenshot below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/39f695ce-6ea0-43dc-9e30-4deb1f9eaefb)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/16574805-30f3-472f-b4cb-730b10706825)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/b035b8f9-f29e-4229-bbb1-76a4db25bf23)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/07110d79-f673-4997-81e4-532395087a75)
<br><br/>
Whenever any traffic comes at Port 80 of ALB it will be redirected to 443 and i had opened port 80 and 443 to entire world. You can provide your VPN IP here which is provided by your organisation
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/4ff6c147-71f6-40c4-a2fc-fb3353a4f011)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/bffb8c55-5f90-4ba3-8b70-869027ce59d6)
<br><br/>
Below is the Security Group for Jenkins-Master
<br><br/>
I have opened port 8080 for ALB Security Group becuase it is going perform health check of the Application which is running in EC2 Instance behind the Load Balancer and hence access the Applicaion and opened port 22 for My Public IP, So that I can login into the EC2 Instance using secure shell (SSH).
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/65b51968-2bd1-4399-9c7c-4ae7049baf54)
<br><br/>
For Jenkins-Slave below is the security group
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/b6289f31-cdf3-49c8-afc3-279dcff6ffad)
I have opened VPC CIDR on port 22 for SSH and used Jenkins-Slave's private IP to configure Jenkins-Slave Node and opened port 22 for my public IP to login using secure shell (SSH).

![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/518a4b25-6247-4b41-9dff-33e10cf60f9e)

<br><br/>
I have configured Email-Notification as shown in the screenshot below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/55fbe8aa-70fd-49f3-8a82-1abae70c8add)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/708a559a-6571-4a77-8b41-f290c774e40b)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/211fb7c6-3cb3-422b-bdb6-23d30ad15c0e)
<br><br/>
You can configure SES using sendmail on Jenkins-Slave EC2 as shown in the Project-1, if you need to send any report.
<br><br/>
**Security Group for SonarQube Server and Nexus Server is shown in the Screenshot below**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/222069d4-8a5c-4ca1-9e12-cd3a558b2d3a)
For ALB security Group I have opened port 9000 to perform health check and hence access the Application and I have opened port 9000 and 22 for my public IP. To login into EC2 using secure shell (SSH) opened port 22 and after installation of sonarqube just used http://<my-public-Ip>:9000 for testing purpose (Just for testing whether sonarqube is installed properly or not).
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/71724c4a-f1dd-4263-9cab-6ec2c87b2a6a)
For ALB security Group I have opened port 8081 to perform health check and hence access the Application and I have opened port 8081 and 22 for my public IP. To login into EC2 using secure shell (SSH) opened port 22 and after installation of Sonatype-Nexus just used http://<my-public-Ip>:8081 for testing purpose (Just for testing whether Nexus is installed properly or not).
<br><br/>
For both the RDS I have opened port for both the VPC CIDRs. As the EKS is present in another VPC and the 2 tier application will communicate with the MySQL RDS, I have established VPC peering between the two VPCs. If you want you can remove EKS VPC CIDR from PostgreSQL RDS Security Group, As the PostgreSQL RDS is created to communicate with the SonarQube Server and PostgreSQL and SonarQube-Server both are present in the same VPC.
<br><br/>
Jenkins-Master, Jenkins-Slave, SonarQube-Server and Nexus-Server all are present in the same VPC as of both the RDS.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/5490aa74-8a18-4c27-932b-f4555f3c0893)

![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/b483e359-7dc6-4945-a3cb-c15bac7fdaf4)
<br><br/>
Finally you will be able to access the Application.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/ef3c46f0-829f-4b90-a7bb-d9a252683edf)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/236e16c7-e504-4715-99c1-9bc9c40ddda8)





<br><br/>
<br><br/>
<br><br/>
<br><br/>
<br><br/>
**This is the project which I have created for Demostration purpose as a General Project that's why I have used Public Repository.**
