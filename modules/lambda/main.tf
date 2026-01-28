terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }
}

# Zip lambda source automatically
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/lambda_function.zip"
}

# Lambda function
resource "aws_lambda_function" "this" {
  function_name = "mylambdafunction"
  role          = var.role_arn
  runtime       = "python3.9"

  # IMPORTANT: file name must match python file
  handler = "start_databrew_job.lambda_handler"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout = 60

  environment {
    variables = {
      ENV = "dev"
    }
  }
}
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke-${var.bucket_name}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.bucket_arn
}
