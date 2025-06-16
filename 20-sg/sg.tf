module "mysql_sg" {
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

module "bastion_sg" {
  source = "git::https://github.com/dhanushboga/sg-module.git?ref=main"
  Project_name = var.Project_name
  environment = var.environment
  common_tags = var.common_tags
  sg_name = "bastion"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  
}

resource "aws_security_group_rule" "mysql_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend_sg.id
  security_group_id = module.backend_sg.id
}

resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.mysql_sg.id
}


resource "aws_security_group_rule" "backend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.backend_sg.id
}

resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.frontend_sg.id
}