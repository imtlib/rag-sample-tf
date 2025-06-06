# ------- Terraform の基本設定 -------
variable "prefix" {
  type = string
}

variable "application_name" {
  type = string
}

# ------- EventBridge の設定 -------
variable "lambda_function_arn" {
  type        = string
  description = "Lambda関数のARN"
}