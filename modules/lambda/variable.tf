variable "function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "handler" {
  type        = string
  description = "Lambda handler"
}

variable "runtime" {
  type        = string
  description = "Lambda runtime"
}

variable "role_arn" {
  type        = string
  description = "IAM Role ARN for Lambda"
}

variable "filename" {
  type        = string
  description = "Lambda deployment package zip"
}
