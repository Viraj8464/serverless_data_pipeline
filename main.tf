# Root main.tf

# S3 bucket module
module "s3_bucket" {
  source               = "./modules/s3"
  bucket_name          = "upload-bucket-data-pipeline-8464"
  lambda_function_arn  = module.lambda_function.arn
  lambda_function_name = module.lambda_function.function_name
}

# DynamoDB table module
module "dynamodb_table" {
  source = "./modules/dynamodb"
}

# Athena module
module "athena" {
  source = "./modules/athena"
}

# Glue raw catalog
module "glue_catalog" {
  source = "./modules/glue/glue_raw"
}

# Glue cleaned catalog
module "glue_catalog_cleaned" {
  source = "./modules/glue/glue_cleaned"
}

# Databrew
module "databrew" {
  source = "./modules/databrew"
}

# Lambda function module
module "lambda_function" {
  source = "./modules/lambda"

  # 👇 pass required inputs for your Lambda here
  function_name = "my-lambda-fn"
  handler       = "index.handler"
  runtime       = "python3.12"
  role_arn      = "arn:aws:iam::123456789012:role/my-lambda-role"

  # Example: if using deployment package
  filename      = "lambda_function_payload.zip"
}
