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

data "aws_ssm_parameter" "bastion_sg" {
  
  name = "/${var.Project_name}/${var.environment}/bastion_sg"
}


data "aws_ssm_parameter" "public_subnet_ids" {
  
  name = "/${var.Project_name}/${var.environment}/public_subnet_ids"
}
