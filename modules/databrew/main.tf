resource "aws_databrew_dataset" "raw_dataset" {
  name        = "raw-dataset"
  input {
    s3_input_definition {
      bucket = var.bucket_name
      key    = "data/"
    }
  }
}

resource "aws_databrew_recipe" "clean_recipe" {
  name   = "cleaning-recipe"
  steps_file_content = file("${path.module}/databrew_recipe.yaml")
}

resource "aws_databrew_project" "clean_project" {
  name         = "databrew-clean-project"
  dataset_name = aws_databrew_dataset.raw_dataset.name
  recipe_name  = aws_databrew_recipe.clean_recipe.name
  role_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_role_name}"
}

resource "aws_databrew_job" "clean_job" {
  name           = "databrew-clean-job"
  project_name   = aws_databrew_project.clean_project.name
  type           = "RECIPE"
  role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_role_name}"

  outputs {
    location {
      bucket = var.bucket_name
      key    = "data/cleaned/"
    }
    format = "CSV"
  }
}

# Automatically trigger DataBrew job when S3 gets new objects in /data
resource "aws_s3_bucket_notification" "databrew_trigger" {
  bucket = var.bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.databrew_trigger.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "data/"
  }
}

resource "aws_lambda_function" "databrew_trigger" {
  function_name = "databrewTrigger"
  role          = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_role_name}"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  filename = "${path.module}/trigger_databrew.zip"

  environment {
    variables = {
      JOB_NAME = aws_databrew_job.clean_job.name
    }
  }
}

output "databrew_job_name" {
  value = aws_databrew_job.clean_job.name
}
