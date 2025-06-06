# ------- Terraform の基本設定 -------
variable "prefix" {
  type = string
}

variable "application_name" {
  type = string
}

# ------- Lambda の設定 -------
variable "eventbridge_rule_arn" {
  type = string
}