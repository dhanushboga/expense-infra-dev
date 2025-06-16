locals {
  resource_name = "${var.Project_name}-${var.environment}"
  ami_id = data.aws_ami.ec2.id
  database_subnet_id = split(",",data.aws_ssm_parameter.database_subnet_ids.value)[0]
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg.value
  private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
  backend_sg_id = data.aws_ssm_parameter.backend_sg.value
  public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  frontend_sg_id = data.aws_ssm_parameter.frontend_sg.value
  ansible_sg_id = data.aws_ssm_parameter.ansible_sg.value
}