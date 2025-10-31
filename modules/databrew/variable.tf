variable "bucket_name" {
  description = "bucket name for store data"
  type        = string
}

variable "dataset_name" {
  type        = string
  description = "Dataset name for DataBrew"
  default     = "rawdataset"
}

variable "project_name" {
  type        = string
  description = "Project name for DataBrew"
  default     = "cleanproject"
}


variable "iam_role_arn" {
  description = "The ARN of the IAM role for DataBrew job execution"
  type        = string
}

variable "recipe_name" {
  description = "The name of the DataBrew recipe"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name for AWS DataBrew"
  type        = string
}
variable "job_name" {
  description = "DataBrew job name"
  type        = string
  default     = "cleanjob"
}
