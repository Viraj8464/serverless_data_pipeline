terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "upload-bucket-data-pipeline-8464"  # your backend bucket
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
