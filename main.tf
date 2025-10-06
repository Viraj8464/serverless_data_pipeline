terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = ">= 1.0.0"
    }
  }

  backend "s3" {
    bucket = "myfirstbucket-8464"
    key    = "terraform/state/serverless_data_pipeline.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# Lambda module
module "lambda_function" {
  source = "./modules/lambda"
  function_name = "mylambdafunction"
}

# S3 bucket module (depends on lambda)
module "s3_bucket" {
  source              = "./modules/s3"
  bucket_name         = "upload-bucket-data-pipeline-8464"
  lambda_function_arn = module.lambda_function.lambda_function_arn
}

# Glue Raw Catalog
module "glue_catalog" {
  source      = "./modules/glue/glue_raw"
  bucket_name = module.s3_bucket.s3_bucket_name
}

# Glue Cleaned Catalog
module "glue_catalog_cleaned" {
  source      = "./modules/glue/glue_cleaned"
  bucket_name = module.s3_bucket.s3_bucket_name
}

# Athena
module "athena" {
  source      = "./modules/athena"
  bucket_name = module.s3_bucket.s3_bucket_name
}

# DataBrew
module "databrew" {
  source      = "./modules/databrew"
  bucket_name = module.s3_bucket.s3_bucket_name
}

# DynamoDB
module "dynamodb_table" {
  source = "./modules/dynamodb"
}
