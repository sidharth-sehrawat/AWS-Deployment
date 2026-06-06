terraform {
  backend "s3" {
    bucket         = "aws-deployment-172121199482-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "aws-deployment-terraform-lock"
    encrypt        = true
  }
}
