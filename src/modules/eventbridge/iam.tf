resource "aws_iam_role" "eventbridge_service_role" {
  name               = "${var.prefix}-eventbridge-service-role"
  assume_role_policy = data.aws_iam_policy_document.eventbridge_policy.json
}