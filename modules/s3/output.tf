output "s3_bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.this.bucket
}

output "sample_object_url" {
  description = "The S3 URL of the uploaded sample object"
  value       = "s3://${aws_s3_bucket.this.bucket}/${aws_s3_object.sample_data.key}"
}
