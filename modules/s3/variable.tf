variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "lambda_function_arn" {
  description = "Lambda function ARN"
  type        = string
}

variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function to trigger"
}

variable "environment" {
  type        = string
  description = "Environment tag for the S3 bucket"
  default     = "Dev"
}
