terraform {
  backend "s3" {
    bucket = "dolo-dempo"
    key = "alb/Jenkins-Master/dev/terraform.tfstate"  ### "alb/sonarqube/dev/terraform.tfstate"  for SonarQube  ### "alb/nexus/dev/terraform.tfstate" for Nexus
    region="us-east-2"
    dynamodb_table = "terraform-state"
  }
}
