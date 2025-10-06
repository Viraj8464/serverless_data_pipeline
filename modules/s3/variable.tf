variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}

variable "lambda_function_arn" {
  description = "Lambda function ARN for S3 trigger"
  type        = string
}
