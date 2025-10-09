

# ----------------- S3 -----------------
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  lambda_function_arn = module.lambda.lambda_functions["databrew_trigger_arn"]
}

# ----------------- IAM Role -----------------
resource "aws_iam_role" "lambda_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })
}

# Attach AWS basic Lambda execution policy
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ----------------- Lambda -----------------
module "lambda" {
  source             = "./modules/lambda"
  function_name      = var.function_name
  role_arn           = aws_iam_role.lambda_role.arn
  bucket_name        = module.s3.bucket_name
  bucket_arn    = module.s3.bucket_arn
}

# ----------------- Glue -----------------
module "glue" {
  source      = "./modules/glue"
  bucket_name = module.s3.bucket_name
}

# ----------------- DataBrew -----------------
module "databrew" {
  source      = "./modules/databrew"
  bucket_name = module.s3.bucket_name
}

# ----------------- DynamoDB -----------------
module "dynamodb" {
  source = "./modules/dynamodb"
bucket_name = module.s3.bucket_name
table_name  = "dynamodb-table"
}

# ----------------- Athena -----------------
module "athena" {
  source      = "./modules/athena"
  bucket_name = module.s3.bucket_name
}
