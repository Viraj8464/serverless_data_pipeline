output "arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.this.arn
}
