variable "bucket_name" {}
variable "role_arn" {
  type = string
}

variable "databrew_job" {
  type = string
}
variable "bucket_arn" {
  description = "ARN of S3 bucket allowed to trigger Lambda"
  type        = string
}
