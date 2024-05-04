### Monitoring of end-to-end infrastructure and Application for Project-1
You can Consider this project as continuation of Project-1. In this project I am explaining how to perform monitoring of Infrastructure of Project-1 and Application Performance Monitoring(APM) using NewRelic and CloudWatch.

<br><br/>
I have created EKS Cluster with two nodes of instance type **t3.medium**. 
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f43a0b0c-efd9-48e5-8b0f-8b2d159b59b5)
<br><br/>
**Installation of NewRelic Agent for EKS Cluster using Helm**
<br><br/>
Login to NewRelic Console and go to Kubernetes as a Data Source which is shown in screenshot below.
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/bc3cbb9b-0bdd-446a-99a0-c2be3b20df0b)
<br><br/>
Generate the command using Helm to install the NewRelic Agent on Kubernetes Cluster.
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/4c7cb56a-8779-46a5-803a-0e151fc5a7db)
<br><br/>
**Create the License Key as shown in the screenshot below.**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2aaf7348-7e22-46b0-b26c-eaf27343e012)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/70dbabfc-2d7c-4a1a-9453-6337fcac7027)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/1650d876-72ec-4966-8f43-782bb9b9f4bb)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/c12a6ba5-1224-47c6-82e7-2dd1ec9662a9)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d3946088-d261-4cc7-bd04-a50f8ead3071)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5a5e276e-6725-45f4-8962-a8ccec0cd2fa)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0166ed92-e605-4103-8747-27ebaef4ac7b)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b3f43927-582d-487a-bb35-9a8a3d766a3e)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/89aed8d3-8a1f-4d7b-a8f5-ff19c35bf8da)
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/3f000351-d844-4746-808e-0a1030c732f9)
<br><br/>
```
Create Alert for EKS Cluster eks-demo-cluster-dev for that click on Alerts option in left side column as shown in screenshot below. There are four main components to create Alerts.
1. Destination: It indicates the Group Email Id on which you want to send notification.
2. Alert Policies: It is nothing but a combination of Alert Conditions of similar type.
3. Alert Condition: It indicates the Alert Condition for which you set the threshold and if it will be crossed anotification will be sent on the destination.
4. Workflow: It acts as a bridge between Alert Policies and the Destination.
```
<br><br/>
**Here I am creating Alert Condition, Alert Policy, Alert Condition and Workflow from the Scratch.**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/9799562e-c046-411d-b693-53e74c4d016f)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/179b07cb-6707-43b2-8921-d5f8c053649b)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5cc8c4d4-3b6d-4add-ad88-c4e4ee96ed7d)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/c5a87ad0-b774-4420-89c6-8d927a35ebe3)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/37b0fcca-4fb6-4ea3-b026-67c4f7963a0b)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/44cedc4d-7500-4a5a-ac67-f6263725e40a)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0917e436-88aa-4da3-938a-5e40433158e3)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/8e2debac-6e93-4df6-be5f-8a6e223ef73b)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/dd601fc6-9711-4726-ac18-8108663cb7ba)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/28a5cf03-db8d-4352-ba2b-b8259d814a04)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e1bdec55-5830-46cf-bf38-9934db63d7e2)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d96260e7-d613-4302-ade6-011248a9f59d)
<br><br/>
Create Another Alert Condition
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f24d86fe-8ced-4570-bb14-c208fddb39c5)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/6d909f51-5b31-4d8a-9aeb-2f3bd7caa283)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/153c268b-b2f3-4722-9a6e-934f474c0f6d)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/03ab056d-0eea-49da-8640-58935c26e044)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e2ba6eaa-0e6f-4e0d-9f17-ead126730439)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/231ac824-2816-4b11-909d-91e5e45aaab8)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d45d03a5-34b5-4479-9057-1f912c831ab4)
<br><br/>
As the Memory Utilization crossed the threshold set So the Email Id mentioned in the Destination recieved the Email as shown in the Screenshot below.
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/ceac8746-07e9-4af2-b0a2-ab310b8ef58f)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/42dfa4eb-e8b4-4f3c-9f5c-9bc55c293d4b)
<br><br/>
Now the User will Acknowledge it and work on this issue. As for this scenario, user will increase the cluster size (by increasing the node count of the cluster) after discussing with the Reporting member of the organization. User can also increase the instance type of the existing EKS Cluster Node but the problem with that is it will delete all the existing nodes of the cluster and then create new nodes with increased instance type. 
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f41d0bd0-d7e9-4981-8adb-a99070589606)
<br><br/>
After working on the issue, you need to close it.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2cbcb52d-c1ee-4bf8-9b37-6e0507a03f25)
After Closing the issue you will get the notification on group Email ID as shown below.
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/360f415e-dc80-43d1-bec0-1e237e013470)
When a critical issue arises in an organization, User should work on it as per the SLA(Service Level Agreement) between the Organization and the Client.









<br>           <br/>
<br>           <br/>
<br>           <br/>
<br>           <br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0e6eb344-041e-4950-b072-c3cc17d000ea)
<br><br/>
I am creating an Alert for %CPU Usage and %Memory Usage for desired EKS Cluster eks-demo-cluster-dev as show in the screenshots below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/7daf50e3-3890-486c-8cef-27d18dcc2d60)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/cd9ad0a2-fb6d-4408-83c9-99ffa45e3b49)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/cf34346a-a80d-41e7-8d12-f52dfaad0c23)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/68064852-9421-46d5-8fc6-a03756634e23)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/cbe2a40a-d9bf-4ec5-8b31-e45d9b9873a6)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d111bd58-2c1a-4707-88e1-107638c417c7)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/a8fd97c5-d717-4845-bb91-6fb8e3e5458f)
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d9aa8c82-50c3-42bb-b84d-9cef5af89e39)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/9f66964c-1cf9-49cd-8a39-bf3a2d869283)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/bf7e2ac3-0f41-4544-8a6b-c6fef9d57ba9)

