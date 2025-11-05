variable "bucket_arn" {
  description = "ARN of S3 bucket that triggers Lambda"
  type        = string
}

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
variable "s3_bucket_name" {
  description = "The name of the S3 bucket containing the Lambda code"
  type        = string
}


