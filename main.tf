terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.13.0"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 1.59"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

provider "awscc" {
  region = "us-east-1"
}

# -----------------------
# 1️⃣ IAM Role for Lambda
# -----------------------
resource "aws_iam_role" "lambda_role" {
  name = "myrole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
# -----------------------
# 2️⃣ S3 Bucket
# -----------------------
module "s3_bucket" {
  source              = "./modules/s3"
  bucket_name         = "upload-bucket-data-pipeline"
  lambda_function_arn = module.lambda.lambda_functions["mylambda_arn"]
}
# -----------------------
# 3️⃣ Lambda Function
# -----------------------

module "lambda" {
  source         = "./modules/lambda"
  s3_bucket_name = module.s3_bucket.bucket_name
  function_name  = "databrew_trigger"
  role_arn       = aws_iam_role.lambda_role.arn
  bucket_arn     = module.s3_bucket.bucket_arn  # required by Lambda
  bucket_name    = module.s3_bucket.bucket_name # required by Lambda
}

# -----------------------
# 4️⃣ Glue Database
# -----------------------
module "glue" {
  source      = "./modules/glue"
  bucket_name = module.s3_bucket.bucket_name
}

# -----------------------
# 5️⃣ Databrew
# -----------------------
module "databrew" {
  source        = "./modules/databrew"
  bucket_name   = "upload-bucket-data-pipeline"
  iam_role_arn  = aws_iam_role.lambda_role.arn
  iam_role_name = var.iam_role_name
  dataset_name  = "rawdataset"
  recipe_name   = "cleanrecipe"
  project_name  = "cleanproject"
  job_name      = "cleanjob"
}

# -----------------------
# 6️⃣ DynamoDB Table
# -----------------------
module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "data-pipeline-table"
}

# -----------------------
# 7️⃣ Athena Workgroup
# -----------------------
module "athena" {
  source      = "./modules/athena"
  bucket_name = module.s3_bucket.bucket_name
}


