variable "vpc" {
  type = object({
    name    = string
    cidr    = string
    azs     = list(string)
    private = list(string)
    public  = list(string)
  })
  description = "ALL IN ONE VPC VARIABLES"
}

variable "aws" {
  type = object({
    access_key = string
    secret_key = string
    region     = string
  })
  description = "The AWS credential"
}

variable "ec2" {
  type = object({
    name       = string
    ami_id     = string
    is_monitor = bool
    ins_type   = string
    ins_count  = number
    keyname    = string
  })
  description = "ALL IN ONE EC2 VARIABLES"
}

variable "rds" {
  type = object({
    name                    = string
    engine                  = string
    version                 = string
    instance_class          = string
    storage                 = string
    encrypted               = bool
    dbname                  = string
    username                = string
    password                = string
    port                    = string
    maintenance_window      = string
    backup_window           = string
    backup_retention_period = number
    database_subnets        = list(string)
    family                  = string
    major_engine_version    = string
    is_del_protect          = bool
    env                     = string
    entity                  = string
  })
  description = "ALL IN ONE RDS VARIABLES"
}

variable "sg" {
  type = object({
    name    = string
    ingress = list(string)
  })
  description = "ALL IN ONE SG VARIABLES"
}
