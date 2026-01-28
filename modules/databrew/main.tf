resource "aws_cloudformation_stack" "databrew_stack" {
  name          = "databrew-stack"
  template_body = file("${path.module}/databrew_cf.yaml")

  parameters = {
    BucketName = var.bucket_name
    RoleArn   = var.role_arn
    RecipeName  = var.recipe_name
    DatasetName = var.dataset_name
    ProjectName = var.project_name
    JobName     = var.job_name
 }

  capabilities = ["CAPABILITY_IAM"]
}
