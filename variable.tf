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

variable "sg" {
  type = object({
    name    = string
    ingress = list(string)
  })
  description = "ALL IN ONE SG VARIABLES"
}

variable "db_subnet_gp" {
  type = object({
    name = string
  })
  description = "ALL IN ONE DB SUBNET GROUP VARIABLES"
}
