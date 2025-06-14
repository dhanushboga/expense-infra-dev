variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "Project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    project = "expense"
    Environment = "dev"
    terraform = "true"
  }
}

variable "vpc_tags" {
  default = {
    name = "vpc for expense project"
  }
}

variable "igw_tags" {
  default = {
    purpose = "igw for expense project"
  }
}

variable "public_subnet_tags" {
  default = {
    purpose = "public subnet tags for expense project"
  }
}

variable "private_subnet_tags" {
  default = {
    purpose = "private subnet tags for expense project"
  }
}

variable "database_subnet_tags" {
  default = {
    purpose = "database subnet tags for expense project"
  }
}

variable "public_route_tags" {
  default = {
    purpose = "public route tags for expense project"
  }
}

variable "private_route_tags" {
  default = {
    purpose = "private route tags for expense project"
  }
}

variable "database_route_tags" {
  default = {
    purpose = "database route tags for expense project"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidr" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "is_peering_required" {
  default = "true"
}

variable "vpc_peering_tags" {
  default = {
    Name = "tagging for vpc peering"
  }
}

variable "db_subnet_group_tags" {
  default = {
    Name = "tagging for db subnet group"
  }
}
