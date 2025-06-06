/*==============
  Root file
===============*/

# ------- S3 -------
module "s3" {
  source           = "../../modules/s3"
  prefix           = var.prefix
  application_name = var.application_name
}

# ------- EventBridge -------
module "eventbridge" {
  source              = "../../modules/eventbridge"
  prefix              = var.prefix
  application_name    = var.application_name
  lambda_function_arn = module.lambda.lambda_function_arn
}

# ------- Lambda -------
module "lambda" {
  source               = "../../modules/lambda"
  prefix               = var.prefix
  application_name     = var.application_name
  eventbridge_rule_arn = module.eventbridge.eventbridge_rule_arn
}