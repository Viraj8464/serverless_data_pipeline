terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Deploy DataBrew resources using CloudFormation
resource "aws_cloudformation_stack" "databrew_stack" {
  name          = "databrewstack"
  template_body = file("${path.module}/databrew_cf.yaml")

parameters = {
    BucketName  = var.bucket_name
    RoleArn     = var.iam_role_arn
    RecipeName  = "cleanrecipe1"
    DatasetName = var.dataset_name
    ProjectName = var.project_name
    JobName     = var.job_name
  }

  capabilities = ["CAPABILITY_IAM"]
}
