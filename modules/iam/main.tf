resource "aws_iam_role" "databrew_role" {
  name = "newrole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "glue.amazonaws.com",
            "databrew.amazonaws.com"
          ]
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "databrew_s3_access" {
  name   = "databrew-s3-access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject","s3:PutObject"],
        Resource = "arn:aws:s3:::${var.bucket_name}/data/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "databrew_s3_attach" {
  role       = aws_iam_role.databrew_role.name
  policy_arn = aws_iam_policy.databrew_s3_access.arn
}
