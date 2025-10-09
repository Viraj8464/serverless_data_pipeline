variable "lambda_function_arn" {
  description = "ARN of Lambda function to trigger on S3 upload"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}
