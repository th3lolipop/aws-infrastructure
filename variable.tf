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
    name              = string
    cidr              = string
    azs               = list(string)
    private           = list(string)
    public            = list(string)
    database          = list(string)
    ecache            = list(string)
    enable_dbsubg     = bool
    enable_dbsubrt    = bool
    enable_cachesubg  = bool
    enable_cachesubrt = bool
    enable_nat        = bool
    enable_s3ep       = bool
    env               = string
    owner             = string
    team              = string
    db_rt_tags        = map(string)
    ecache_rt_tags    = map(string)
    pri_rt_tags       = map(string)
    pub_rt_tags       = map(string)
    igw_tags          = map(string)
    natgw_tags        = map(string)
    nateip_tags       = map(string)
    pubsub_tags       = map(string)
    prisub_tags       = map(string)
    dbsub_tags        = map(string)
    ecachesub_tags    = map(string)
    nacl_tags         = map(string)
    db_sub_gp_tags    = map(string)
    default_sg_tags   = map(string)
    default_sg_name   = string
  })
  description = "ALL IN ONE VPC VARIABLES"
}

variable "ec2" {
  type = object({
    name         = string
    ami_id       = string
    is_monitor   = bool
    ins_type     = string
    ins_count    = number
    keyname      = string
    ebs_optimize = bool
    volume_tags  = map(string)

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
    family                  = string
    major_engine_version    = string
    is_del_protect          = bool
    subnet_gp_create        = bool
    allow_minor             = bool
    env                     = string
    owner                   = string
  })
  description = "ALL IN ONE RDS VARIABLES"
}

variable "sg" {
  type = object({
    name_api   = string
    name_admin = string
    name_db    = string
    ingress    = list(string)
    egress     = list(string)
  })
  description = "ALL IN ONE SG VARIABLES"
}

variable "s3_name" {
  default = ""
  type    = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9]{4,15}$", var.s3_name))
    error_message = "Bucket name can't be include special character."
  }
}

variable "s3" {
  type = object({
    is_private    = bool
    bucket_create = bool
    env           = string
    owner         = string
    project       = string
  })
  description = "S3 Configuration VARIABLES with conditions"
}

variable "sqs" {
  type = object({
    name         = string
    create       = bool
    visible_time = number
    env          = string
    owner        = string
    project      = string
    team         = string
  })
  description = "SQS ALL IN ONE Configuration VARIABLES"
}
