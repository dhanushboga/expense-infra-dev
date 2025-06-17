module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name
  ami = local.ami_id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id              = local.database_subnet_id

  tags = merge(var.common_tags,var.mysql_tags,
  {
    Name = "${local.resource_name}-mysql"
  }
  
  )
}

module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name
  ami = local.ami_id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.backend_sg_id]
  subnet_id              = local.private_subnet_id

  tags = merge(var.common_tags,var.backend_tags,
  {
    Name = "${local.resource_name}-backend"
  }
  
  )
}

module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name
  ami = local.ami_id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge(var.common_tags,var.frontend_tags,
  {
    Name = "${local.resource_name}-frontend"
  }
  
  )
}



module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name
  ami = local.ami_id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.ansible_sg_id]
  subnet_id              = local.public_subnet_id
  user_data = file("expense.sh")

  tags = merge(var.common_tags,var.ansible_tags,
  {
    Name = "${local.resource_name}-ansible"
  }
  
  )
}

resource "aws_route53_zone" "expense" {
  name = var.zone_name
}

resource "aws_route53_record" "expense_mysql" {
  zone_id = aws_route53_zone.expense.zone_id
  name    = "mysql.${var.zone_name}" # add your desired domain name
  type    = "A"
  ttl     = 1
  records = [module.mysql.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "expense_backend" {
  zone_id = aws_route53_zone.expense.zone_id
  name    = "backend.${var.zone_name}" # add your desired domain name
  type    = "A"
  ttl     = 1
  records = [module.backend.private_ip]
  allow_overwrite = true
}


resource "aws_route53_record" "expense_frontend" {
  zone_id = aws_route53_zone.expense.zone_id
  name    = "frontend.${var.zone_name}" # add your desired domain name
  type    = "A"
  ttl     = 1
  records = [module.frontend.public_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "expense_access" {
  zone_id = aws_route53_zone.expense.zone_id
  name    = "" # add your desired domain name
  type    = "A"
  ttl     = 1
  records = [module.frontend.public_ip]
  allow_overwrite = true
}


