variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "lambda_function_arn" {
  type        = string
  description = "The ARN of the Lambda function"
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function"
}
