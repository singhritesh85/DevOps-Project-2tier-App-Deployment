### Monitoring of end-to-end infrastructure and Application for Project-1
You can Consider this project as continuation of Project-1. In this project I am explaining how to perform monitoring of Infrastructure of Project-1 and Application Performance Monitoring(APM) using NewRelic and RDS Monitoring using CloudWatch.

<br><br/>
I have created EKS Cluster with two nodes of instance type **t3.small**. 
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
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/f81ae374-fa92-481c-aec3-f50991170a7a)
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
<br><br/>
**Summary diagram for EKS Cluster eks-demo-cluster-dev is shown in the screenshot attached below.**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/99a62c45-158f-4943-aad8-79307184a193)
<br><br/>
**I have explained APM (Application Performance Monitoring), RUM (Real Time User Monitoring) and Synthetic Monitoring below.**
#### Application Performance Monitoring
<br><br/>
Download the zip file into the project directory using the command as written below.
```
curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip
```
<br><br/>
**For APM below lines should be added to Dockerfile.**
<br><br/>
```
RUN mkdir -p /usr/local/tomcat/newrelic
RUN mkdir -p /usr/local/tomcat/newrelic/logs
ADD ./newrelic/newrelic.yml /usr/local/tomcat/newrelic/newrelic.yml
ADD ./newrelic/newrelic.jar /usr/local/tomcat/newrelic/newrelic.jar
ENV JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/newrelic/newrelic.jar"
ENV NEW_RELIC_APP_NAME="PROVIDE_YOU_APP_NAME"
ENV JAVA_OPTS="$JAVA_OPTS -Dnewrelic.config.app_name='PROVIDE_YOUR_APP_NAME'"
ENV NEW_RELIC_LICENSE_KEY="PROVIDE_THE_LICENSE_KEY"
ENV JAVA_OPTS="$JAVA_OPTS -Dnewrelic.config.license_key='PROVIDE_THE_LICENSE_KEY'"
```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/a7ff7f87-5208-4bb3-ab6f-6399dac4dc54)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/ccfa13a0-f42a-4453-b151-ae7eb0d11a9a)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/9aeacf81-4ad1-44de-9f16-f7cc9305d786)
<br><br/>
Screenshot of the Dockerfile after adding APM content is as shown below
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d1307e65-da35-4b5e-be40-2ce217bc05bf)

<br><br/>
**Web transaction time:**
It is sum of all the activity over the time a service recieves a web request and provide the response.
<br><br/>
In the screenshot attached the web transaction time of nearly 800ms and 200ms around 10:00AM and 10:12AM UTC respectively represents transaction is quick at 10:12AM as compared to 10:00AM. 
<br><br/>
**Apdex Score:** Apdex Score measures the user's satisfaction with the web application. It's value lies between 0 to 1. A zero apdex score represents 100% request was frustrated and 1 apdex score respresents 100% request was satisfied.
```
Apdex Score = (Satisfied Request + (Tolerated Request/2))/Total Request

Total Request = Satisfied Request + Tolerated Request + Frustrated Request

```
```
I am explaining Apdex Score through an example. Let us consider a host receives 100 requests in an interval of 1 minute and Apdex Threhold is 250 ms.
70 requests are handled within 250 ms, it is called as satified requests.
20 requests are handled between 250 ms and 2 seconds. So it is called as tolerated request.
10 requests are handled in more than 2 seconds. So it is termed as frustrated requests.

Apdex score = (70+(20/2))/100 = 0.8.
```
**Throughput:** For APM throughput can be considered as requests per minute (RPM). For Browser it can be considered as page view per minute (PPM).
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b283e89b-0edb-4026-adb3-35229d2c03f8)
<br><br/>
The same result I have found from trivy image scan. The screenshot of trivy image scan result is attached below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e98efcfb-2023-4873-af3d-277eb841c646)
<br><br/>
##### Below I am explaining Synthetic Monitoring of type Ping
Using this methodology I am pinging an URL in an interval of 1 miniute if URL will not be available then I will be notified for the same on my Email ID.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/83875620-8ca4-4025-b2a4-ed7d04542b06)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/03327e7f-48fc-49fd-9f17-e36558da4d50)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/6865b411-ecc9-46e2-b2af-1778098050a6)
<br><br/>
Created a Alarm policy for Synthetic Monitoring.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/1477652d-f73c-465a-906f-d0bdc6c8c7fa)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e9db5b4e-4536-4d25-a1c7-4157e6222ce9)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/7bdcc8bd-a6ba-4a8d-b96f-03041962a5f3)
<br><br/>
Create Alarm condition for synthetic monitoring.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/563fae0a-daeb-44e1-81fe-23e7b4284136)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/e27eed3d-8bce-408c-8aee-168e716143f5)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/14fe2990-6222-45f8-ba42-57d53ef06c7b)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/094cdb8d-dee5-49e2-8fe4-0eb657dcfc07)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/d081c9e1-b309-403a-a754-cbc87dcbb8ef)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/6f1eb823-87cf-4bbf-a2eb-540d923cf93c)

<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/1399667b-349f-4c4b-bda4-88db81e0ab43)
Now for the demonstration purpose I removed the entry from Route53 record set for demo-app and jenkins-master URL and check how synthetic monitoring behaves.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/c4a24757-d5ff-4158-b589-e9270c5a252d)
<br><br/>
An email has been sent on the group Email ID and user will ackowledge this issue and work on in it. After worked on the issue user will close it.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/ee0105c8-57a8-4519-8b79-31d3f3b4f023)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b6ba213d-a1a1-4254-b548-2bb68a2666ad)
<br><br/>
After Closing the issue the Synthetic monitoring will work as working before, screenshot attach below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/11024dcc-bfbb-4f0d-af31-19969f5a8d88)
<br><br/>
In the similar way it is possible to monitor SSL Certificate Expiration, API Endpoint etc using Synthetic Monitoring.
<br><br/>
**Browser Monitoring:** In NewRelic Real Time User Monitoring (RUM) will be performed using Browser Monitoring.
<br><br/>
Go to **+ADD Data** option in left hand side column and Serach for Browser Monitor as shown in the screenshot below. RUM tracks end user experience in Application, how log it takes to web page get loaded. Weather the web page has any error.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/26202eaa-8031-4d8a-a22f-0e97d228b8f7)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/f1f7a5a3-5066-448b-ac03-970ee7095f44)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/b9f4896c-1604-48f8-af1a-df5741b03458)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/bf2b7b6e-2015-45db-850e-3a32ca44cb82)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/02ef3bd4-9428-4851-ac29-0397f176cb0d)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/37b7d36d-0b5f-4cc9-89fc-b6702f9673db)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/05e607f7-d00c-44ef-8b44-3627331bab37)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/0a1cf29a-e4b8-4c1a-b702-2f119453063f)
<br><br/>
**For RDS Monitoring cloudwatch can be used and I have enabled the enhanced monitoring of RDS. With enhanced monitoring of RDS we can monitor granular level monitoring of OS metrics of DB Instance.**
<br><br/>
Open Cloudwatch console and go to Dashboard > Automatic Dashboard > RDS. The screenshot of the same is shown below.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/310d64fe-3c5d-493b-974b-5a2cec9e1142)
<br><br/>
Using this Dashboard you can create a new Dashboard as shown in screenshot below.
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/391ed9b8-9aef-4d02-b662-99fee701b5ff)
<br><br/>
You can add further graphs in this Dashboard and from Cloudwatch Alarm it possible to create Alarm using the existing metrics. 
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/d5b3a1ea-e2e7-4375-91eb-cc0d8ea9e6aa)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/437fec71-5238-43ae-bc02-79dbace926bb)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/a9a95904-7e84-4beb-bd81-ec79188b55da)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/3a46dba2-1abb-4068-b90d-50b43e4397a3)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/4f7ab7cf-7648-44d9-81f2-ad81ff4c9fcb)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/31b15087-35c6-47d7-ad99-1946a5fff1c7)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/8453a774-9d14-4ad5-85f1-7d048950d5fb)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/c68e5d70-4494-4142-a9cf-775df49d4b83)
<br><br/>
You can create Alarm depending on your need from the Cloudwatch console in left side column using the Alarm tab and the availabe Metrics.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/e70bb4ff-eb2d-42e7-abe0-22bdb36af03c)
<br><br>
Whenever it crosses the threshold it will send notification on group email id using the SNS Topic and Subscription.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/c0baf0a0-b5aa-4d03-880d-5d94d2bb7664)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/6c491663-7ff0-43c1-9717-ad854d8233ca)
<br><br/>
**For Centralized Logging I am using here NewRelic, However ELK can also be used but here I am using NewRelic.**
<br><br/>
I had installed NewRelic Agent using helm to this EKS Cluster which capture logs from the cluster and send them to newrelic.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/37819a73-d188-4371-9c22-b21e94e24b07)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/68b54ce1-db4e-4d71-85f8-536a39e1c2ff)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/5f76b493-f4c1-474e-84ac-72acec022475)
<br><br/>
**For RDS Logs are captured to Cloudwatch Log Group as shown in the screenshots below.**
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/15761326-1418-4b75-84ed-6ddd176cb4b2)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/39b6b4d1-9db5-479c-92e4-42cdbe2e9c5d)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/39c13c6d-922d-41a4-b73c-704e564821bb)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/904bff41-3d84-4f8b-a7a6-b69ea66f06a7)
![image](https://github.com/singhritesh85/DevOps-Project-2tier-WebApp-Deployment/assets/56765895/1569f948-8e2c-4561-a476-be185362c787)

<br><br/>
