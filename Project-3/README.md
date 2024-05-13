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
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/bbf59e88-2ccc-42b0-ab1b-03cd570d5029)




<br><br/>
<br><br/>
<br><br/>
**This is project I have created for Demostration purpose that's why I have used Public Repository.**
