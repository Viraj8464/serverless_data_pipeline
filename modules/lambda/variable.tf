variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket used by Lambda"
  type        = string
}
