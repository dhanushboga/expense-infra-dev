module "sql_sg" {
  source = "git::https://github.com/dhanushboga/sg-module.git?ref=main"
  Project_name = var.Project_name
  environment = var.environment
  common_tags = var.common_tags
  sg_name = "mysql"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}