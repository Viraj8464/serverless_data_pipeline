module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "lambda" {
  source                = "./modules/lambda"
  bucket_name           = module.s3_bucket.bucket_name
  lambda_function_name  = var.lambda_function_name
  iam_role_name         = var.iam_role_name
  dynamodb_stream_arn   = module.dynamodb.stream_arn
}

module "databrew" {
  source      = "./modules/databrew"
  bucket_name = module.s3_bucket.bucket_name
}

module "glue" {
  source      = "./modules/glue"
  bucket_name = module.s3_bucket.bucket_name
}

module "athena" {
  source      = "./modules/athena"
  bucket_name = module.s3_bucket.bucket_name
}
