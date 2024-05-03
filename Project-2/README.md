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
**Enter the License Key as shown in the screenshot below.**
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
Create Alert for EKS Cluster eks-demo-cluster-dev for that click on Manage Alerts as shown in screenshot below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0e6eb344-041e-4950-b072-c3cc17d000ea)
<br><br/>
I am creating an Alert for %CPU Usage and %Memory Usage for desired EKS Cluster eks-demo-cluster-dev as show in the screenshots below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/7daf50e3-3890-486c-8cef-27d18dcc2d60)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/cd9ad0a2-fb6d-4408-83c9-99ffa45e3b49)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/cf34346a-a80d-41e7-8d12-f52dfaad0c23)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/68064852-9421-46d5-8fc6-a03756634e23)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/17e5cb76-9638-4541-b9b9-e0ea978cb189)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d111bd58-2c1a-4707-88e1-107638c417c7)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/70d8d8be-c137-4d08-b7a7-20bc475cd4e8)


