terraform {
  backend "s3" {
    bucket = "dolo-dempo"
    key = "ec2/Jenkins-Master/dev/terraform.tfstate"
    region="us-east-2"
    dynamodb_table = "terraform-state"
  }
}
