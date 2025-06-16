data "aws_ami" "ec2" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "platform-details"
    values = ["Red Hat Enterprise Linux"]
  }

}

data "aws_ssm_parameter" "public_subnet_ids" {
  
  name = "/${var.Project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  
  name = "/${var.Project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  
  name = "/${var.Project_name}/${var.environment}/database_subnet_ids"
}




data "aws_ssm_parameter" "frontend_sg" {
  
  name = "/${var.Project_name}/${var.environment}/frontend_sg"
}

data "aws_ssm_parameter" "backend_sg" {
  
  name = "/${var.Project_name}/${var.environment}/backend_sg"
}

data "aws_ssm_parameter" "mysql_sg" {
  
  name = "/${var.Project_name}/${var.environment}/mysql_sg"
}