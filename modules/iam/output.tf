output "databrew_role_arn" {
  value = aws_iam_role.databrew_role.arn
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}
