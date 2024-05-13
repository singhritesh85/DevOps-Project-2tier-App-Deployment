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
