variable "bucket_name" {
  description = "my-new-unique-bucket-viraj"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to trigger on S3 events"
  type        = string
}
