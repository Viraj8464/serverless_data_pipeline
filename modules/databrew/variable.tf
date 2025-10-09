variable "bucket_name" {
  description = "S3 bucket used by DataBrew"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for DataBrew"
  type        = string
}
