resource "aws_lambda_function" "this" {
  function_name = "mylambdafunction"
  role          = var.role_arn
  handler       = "start_databrew_job.lambda_handler"
  runtime       = "python3.9"

  filename         = "${path.module}/../../lambda_code/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../../lambda_code/lambda.zip")
}
