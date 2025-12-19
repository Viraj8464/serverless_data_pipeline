provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source      = "./modules/iam"
  bucket_name = var.bucket_name
}

module "lambda" {
  source        = "./modules/lambda"
  role_arn     = module.iam.lambda_role_arn
  databrew_job = var.databrew_job_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  lambda_arn  = module.lambda.lambda_arn
}

module "databrew" {
  source      = "./modules/databrew"
  bucket_name = var.bucket_name
  role_arn    = module.iam.databrew_role_arn
}

module "glue" {
  source      = "./modules/glue"
  bucket_name = var.bucket_name
}
