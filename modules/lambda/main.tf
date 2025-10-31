# -----------------------
# IAM Role for Lambda
# -----------------------
resource "aws_iam_role" "lambda_role" {
  name = "myrole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "glue.amazonaws.com",
            "databrew.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}



# -----------------------
# Lambda Function
# -----------------------
resource "aws_lambda_function" "mylambda" {
  function_name = "mylambdafunction"
  role          = aws_iam_role.lambda_role.arn
  handler       = "src.handler.lambda_handler" # Python file and function
  runtime       = "python3.9"
  s3_bucket     = var.s3_bucket_name
  s3_key        = "lambda.zip"
}

resource "aws_iam_role_policy" "databrew_s3_access" {
  name = "databrew-s3-access"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
           "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::upload-bucket-data-pipeline",
          "arn:aws:s3:::upload-bucket-data-pipeline/*"
        ]
      }
    ]
  })
}
