locals {
  resource_name = "${var.Project_name}-${var.environment}-bastion"
  ami_id = data.aws_ami.ec2.id
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg.value
  public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
}