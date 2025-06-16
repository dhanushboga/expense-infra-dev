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

variable "frontend_tags" {
  default = {
    component = "frontend"
  }
}

variable "backend_tags" {
  default = {
    component = "backend"
  }
}

variable "mysql_tags" {
  default = {
    component = "mysql"
  }
}

variable "ansible_tags"{
  default = {
    component = "ansible"
  }
}

variable "zone_name" {
  default = "chenchudaws82s.online"
}