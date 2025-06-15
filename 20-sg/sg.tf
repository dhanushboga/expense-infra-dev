module "sql_sg" {
  source = "git::https://github.com/dhanushboga/sg-module.git?ref=main"
  Project_name = var.Project_name
  environment = var.environment
  common_tags = var.common_tags
  sg_name = "mysql"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  
}

module "backend_sg" {
  source = "git::https://github.com/dhanushboga/sg-module.git?ref=main"
  Project_name = var.Project_name
  environment = var.environment
  common_tags = var.common_tags
  sg_name = "backend"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  
}


module "frontend_sg" {
  source = "git::https://github.com/dhanushboga/sg-module.git?ref=main"
  Project_name = var.Project_name
  environment = var.environment
  common_tags = var.common_tags
  sg_name = "frontend"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  
}

resource "aws_security_group_rule" "mysql_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend_sg.id
  security_group_id = module.sql_sg.id
}

resource "aws_security_group_rule" "frontend_backend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend_sg.id
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_sg.id
}