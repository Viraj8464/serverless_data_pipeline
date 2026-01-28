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
  bucket_arn = module.s3.bucket_arn
  bucket_name = module.s3.bucket_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  lambda_arn  = module.lambda.lambda_arn
  lambda_permission_dep = module.lambda.lambda_permission
}

module "databrew" {
  source      = "./modules/databrew"
  bucket_name = var.bucket_name
  role_arn    = module.iam.databrew_role_arn
  recipe_name   = "sample-recipe"
  dataset_name  = "sample-dataset"
  project_name  = "sample-project"
  job_name      = "sample-job"
}

module "glue" {
  source      = "./modules/glue"
  glue_role_arn  = module.iam.glue_role_arn
  bucket_name = var.bucket_name
}
