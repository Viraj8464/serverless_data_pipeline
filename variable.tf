variable "bucket_name" {
  description = "S3 bucket name for data pipeline"
  default     = "upload-bucket-data-pipeline"
}

variable "function_name" {
  description = "Lambda function name"
  default     = "mylambdafunction"
}

variable "role_name" {
  description = "IAM role name for Lambda"
  default     = "myrole"
}
