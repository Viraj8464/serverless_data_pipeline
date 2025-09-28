variable "bucket_name" {
  description = "upload-bucket-data-pipeline-8464"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to trigger on S3 events"
  type        = string
}
