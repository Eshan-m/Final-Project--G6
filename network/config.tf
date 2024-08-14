terraform {
  backend "s3" {
    bucket         = "group6-acs1"  # Replace with your S3 bucket name
    key            = "network/terraform.tfstate"
    region         = "us-east-1"  # Replace with your preferred region
  }
}












