variable "aws" {
  type = object({
    access_key = string
    secret_key = string
    region     = string
  })
  description = "The AWS credential"
}

variable "vpc" {
  type = object({
    name            = string
    cidr            = string
    azs             = list(string)
    private         = list(string)
    public          = list(string)
    database        = list(string)
    env             = string
    owner           = string
    db_rt_tags      = map(string)
    pri_rt_tags     = map(string)
    pub_rt_tags     = map(string)
    igw_tags        = map(string)
    natgw_tags      = map(string)
    nateip_tags     = map(string)
    pubsub_tags     = map(string)
    prisub_tags     = map(string)
    dbsub_tags      = map(string)
    nacl_tags       = map(string)
    db_sub_gp_tags  = map(string)
    default_sg_tags = map(string)
    default_sg_name = string
  })
  description = "ALL IN ONE VPC VARIABLES"
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
    storage_type            = string
    storage                 = string
    encrypted               = bool
    dbname                  = string
    username                = string
    password                = string
    port                    = string
    multi_az                = bool
    public_access           = bool
    maintenance_window      = string
    backup_window           = string
    backup_retention_period = number
    db_subnet_gp_name       = string
    database_subnets        = list(string)
    parameter_group_name    = string
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
