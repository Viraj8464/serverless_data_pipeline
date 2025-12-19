resource "aws_cloudformation_stack" "databrew_stack" {
  name          = "databrew-stack"
  template_body = file("${path.module}/databrew_cf.yaml")

  parameters = {
    BucketName = var.bucket_name
    RoleArn   = var.role_arn
  }

  capabilities = ["CAPABILITY_IAM"]
}
