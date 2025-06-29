resource "aws_ssm_parameter" "mysql_sg" {
  name  = "/${var.Project_name}/${var.environment}/mysql_sg"
  type  = "String"
  value = module.mysql_sg.id
}

resource "aws_ssm_parameter" "backend_sg" {
  name  = "/${var.Project_name}/${var.environment}/backend_sg"
  type  = "String"
  value = module.backend_sg.id
}

resource "aws_ssm_parameter" "frontend_sg" {
  name  = "/${var.Project_name}/${var.environment}/frontend_sg"
  type  = "String"
  value = module.frontend_sg.id
}

resource "aws_ssm_parameter" "bastion_sg" {
  name  = "/${var.Project_name}/${var.environment}/bastion_sg"
  type  = "String"
  value = module.bastion_sg.id
}

resource "aws_ssm_parameter" "ansible_sg" {
  name  = "/${var.Project_name}/${var.environment}/ansible_sg"
  type  = "String"
  value = module.ansible_sg.id
}


