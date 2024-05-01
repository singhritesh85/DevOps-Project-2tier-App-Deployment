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
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5ecc5ab7-440a-4bd2-bc52-91fe117c4ecb)
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
<br><br>/
Create pipeline syntax for nexus as shown in the screenshot below
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/576d0393-6f9e-4458-adcf-db78bcfe54af)
<br><br/>
Below Srennshot shows the different EC2 Instances, LoadBalancers and TargetGroups for SonarQube, Nexus and Jenkins. 
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/eb94f07d-edc8-435c-81f6-a2fce269cdc6)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/00057fed-66ef-49ff-94e0-04f82fd97b16)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/ab53c220-4ac1-42d4-99b2-65211ad77f61)
<br><br/>
Below screenshot shows the Route53 entry 
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/4a414778-3eba-46ca-9052-7049106d7851)
<br><br/>
Below screenshot shows the RDS two DB Instances with PostgreSQL and MySQL.
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/baa6c8c4-8911-496f-bb0b-8e1d88f892c1)
<br><br/>
**Connect with MySQL DB Instance and create database and table as shown in the screenshot below.**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/854b1803-b60a-4cc3-9944-bbff64b21f82)
**Connect with PostgreSQL DB Instance and create database and user as shown in the screenshot below.**
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/c39ed54e-643a-4eb1-a3ff-a17842a70564)
<br><br/>
**PostgreSQL and MySQL has been used for SonarQube and 2-tier Application repectively.**
<br><br/>
### Installation of Nginx Ingress Controller and ArgoCD
**Installation of Nginx Ingreesss controller**
```
kubectl create ns ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx
kubectl get svc -n ingress-nginx
kubectl edit svc ingress-nginx-controller -n ingress-nginx

Add the below annotations and change the targetPort from https to http

Annotations to be added
=======================
service.beta.kubernetes.io/aws-load-balancer-backend-protocol: http
service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: "60"
service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: "true"
service.beta.kubernetes.io/aws-load-balancer-ssl-cert: arn:aws:acm:us-east-2:XXXXXXXX:certificate/XXXXXX-XXXXXXX-XXXXXXX-XXXXXXXX
service.beta.kubernetes.io/aws-load-balancer-ssl-ports: https
service.beta.kubernetes.io/aws-load-balancer-type: elb

You need to change the targetPort for https to http in nginx ingress controller service as written below:-
========================================================================================================
Before:

  ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: http
    - name: https
      port: 443
      protocol: TCP
      targetPort: https
After:

  ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: http
    - name: https
      port: 443
      protocol: TCP
      targetPort: 80

```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/68efae05-a274-4dd2-a766-5147a3e8ec3d)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/6dae9b9f-b63d-4e2f-a5dc-814d2fb1d992)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/783c15dc-cd59-4793-895f-12314c95a465)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/2f720593-8f23-48f4-9d84-ae5f907affb5)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/438ee91e-edbe-4ba5-8c09-e3cb262b670f)
<br><br/>
**Installation of ArgoCD**
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
### Get password for ArgoCD
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d
### Create Ingress Rule for ArgoCD
vim ingress-rule.yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: minimal-ingress
  namespace: argocd
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"    ###  You can use this option for this particular case for ArgoCD but not for all
spec:
#  ingressClassName: nginx
  rules:
  - host: argocd.singhritesh85.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: argocd-server   ### Provide your service Name
            port:
              number: 80 

kubectl apply -f ingress-rule.yaml
```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/8a6ff78c-fea3-41da-9760-42fb684e2541)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/b1b9a3a7-74d2-4168-ad32-715667aad231)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/6a06bd33-c276-42ac-b3f7-71fb576d55fa)
<br><br/>
**Change admin user password in ArgoCD**
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/74fb4fee-de94-48e1-ae3a-86d4a7f18ea9)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/63c56019-559f-45fa-b25c-dedd4b882072)
<br><br/>
**Install ArgoCD cli**
```
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/5f6f1a21-7d12-44ad-9940-f5e702ed306b)

<br><br/>
**Create Jenkins Job using the Jenkinsfile present in this project directory, run the jenkins job and provide parameters as shown in screenshot below**
```
pipeline{
    agent{
        node{
            label "Slave-1"
            customWorkspace "/home/jenkins/2tierapp/"
        }
    }
    environment {
        JAVA_HOME="/usr/lib/jvm/java-17-amazon-corretto.x86_64"
        PATH="$PATH:$JAVA_HOME/bin:/usr/local/bin:/opt/apache-maven/bin"
    }
    parameters { 
        string(name: 'COMMIT_ID', defaultValue: '', description: 'Provide the Commit ID') 
        string(name: 'REPO_NAME', defaultValue: '', description: 'Provide the Repository Name')
        string(name: 'TAG_NAME', defaultValue: '', description: 'Provide the Tag Name')
        string(name: 'REPLICA_COUNT', defaultValue: '', description: 'Provide the Replica Count')
    }
    stages{
        stage("Clone-code"){
            steps{
                cleanWs()
                checkout scmGit(branches: [[name: '${COMMIT_ID}']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-cred', url: 'https://github.com/singhritesh85/aws-rds-java.git']])
            }
        }
        stage("SonarQubeAnalysis-and-Build"){
            steps {
                withSonarQubeEnv('SonarQube-Server') {
                    sh 'mvn clean package sonar:sonar'
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage("Nexus-Artifact Upload"){
            steps{
                script{
                    def mavenPom = readMavenPom file: 'pom.xml'
                    def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? "maven-snapshot" : "maven-release"
                    nexusArtifactUploader artifacts: [[artifactId: 'LoginWebApp', classifier: '', file: 'target/LoginWebApp.war', type: 'war']], credentialsId: 'nexus', groupId: 'com.javawebtutor', nexusUrl: 'nexus.singhritesh85.com', nexusVersion: 'nexus3', protocol: 'https', repository: "${nexusRepoName}", version: "${mavenPom.version}"
                }    
            }
        }
        stage("Create docker image, scan it and push to ECR"){
            steps{
                sh '''
                      docker system prune -f --all
                      docker build -t demoimage:1.01 .
                      docker tag demoimage:1.01 ${REPO_NAME}:${TAG_NAME}
                      trivy image --exit-code 0 --severity MEDIUM,HIGH ${REPO_NAME}:${TAG_NAME}
                      trivy image --exit-code 1 --severity CRITICAL ${REPO_NAME}:${TAG_NAME}
                      aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 027XXXXXXXX406.dkr.ecr.us-east-2.amazonaws.com
                      docker push ${REPO_NAME}:${TAG_NAME}
                '''
            }
        }
        stage("Deployment"){
            steps{
                sh 'argocd login argocd.singhritesh85.com --username adxxn --password AdXXXXXX --skip-test-tls  --grpc-web'
                sh 'argocd app create demo5 --project default --repo https://github.com/singhritesh85/helm-repo-for-ArgoCD.git --path ./folo --dest-namespace teto --dest-server https://kubernetes.default.svc --helm-set service.port=80 --helm-set image.repository=${REPO_NAME} --helm-set image.tag=${TAG_NAME} --helm-set replicaCount=${REPLICA_COUNT} --upsert'
                sh 'argocd app sync demo5'
            }
        }
    }
    post {
        always {
            mail bcc: '', body: "A Jenkins Job with Job Name ${env.JOB_NAME} has been executed", cc: '', from: 'admin@singhritesh85.com', replyTo: '', subject: "Jenkins Job ${env.JOB_NAME} has been executed", to: 'abc@gmail.com'
        }
        success {
            mail bcc: '', body: "A Jenkins Job with Job Name ${env.JOB_NAME} and Build Number=${env.BUILD_NUMBER} has been executed Successfully, Please Open the URL ${env.BUILD_URL} and click on Console Output to see the Log. The Result of execution is ${currentBuild.currentResult}", cc: '', from: 'admin@singhritesh85.com', replyTo: '', subject: "Jenkins Job ${env.JOB_NAME} has been Sucessfully Executed", to: 'abc@gmail.com'
        }
        failure {
            mail bcc: '', body: "A Jenkins Job with Job Name ${env.JOB_NAME} and Build Number=${env.BUILD_NUMBER} has been Failed, Please Open the URL ${env.BUILD_URL} and click on Console Output to see the Log. The Result of execution is ${currentBuild.currentResult}", cc: '', from: 'admin@singhritesh85.com', replyTo: '', subject: "Jenkins Job ${env.JOB_NAME} has been Failed", to: 'abc@gmail.com'
        }
    }
}
```
<br><br/>
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/6d1ef134-a290-4c7e-a959-564c8819b7e2)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/316d24ba-930d-4119-9a02-cb5373f00140)

<br><br/>
Create Ingress for service created and do the entry in Route53 to create reccord set. Access the Application using the URL created.

![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/815dfdb1-cb25-4ae3-b2d2-176f3fc01df9)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/4513a36e-51a6-4297-91af-9fc1bb32e3f3)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/ebc5e3ec-a1c2-422a-9ec7-f62ff9e2dbf7)
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/20d55af2-1435-4e54-b066-09f46f2468cf)

**Check the entry in database jwt as shown in the screenshot below**
![image](https://github.com/singhritesh85/DevOps-Project/assets/56765895/47001a28-f274-427a-ab7c-c29565c1bf42)




**References** 
1. https://ashok198510.hashnode.dev/cloud-native-two-tier-application-deployment-with-eks-tomcat-and-rds-in-aws <br><br/>
2. https://github.com/Ashoksana/aws-rds-java.git
