module "sg-api" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.16.0"

  name = var.sg.name_api

  description = "Security group for API Server"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.sg.ingress
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  egress_cidr_blocks  = var.sg.egress
  egress_rules        = ["all-all"]
  tags = {
    Name        = var.sg.name_api
    Environment = var.vpc.env
    Owner       = var.vpc.owner
  }
}

module "sg-admin" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.16.0"

  name = var.sg.name_admin

  description = "Security group for API Server"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.sg.ingress
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  egress_cidr_blocks  = var.sg.egress
  egress_rules        = ["all-all"]
  tags = {
    Name        = var.sg.name_admin
    Environment = var.vpc.env
    Owner       = var.vpc.owner
  }
}

module "sg-db" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.16.0"

  name = var.sg.name_db

  description = "Security group for API Server"
  vpc_id      = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "DB port ingress from API"
      source_security_group_id = module.sg-api.this_security_group_id
    },
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "DB port ingress from ADMIN"
      source_security_group_id = module.sg-admin.this_security_group_id
    }
  ]
  egress_cidr_blocks = var.sg.egress
  egress_rules       = ["all-all"]
  tags = {
    Name        = var.sg.name_db
    Environment = var.vpc.env
    Owner       = var.vpc.owner
  }
}

module "sg-cache" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.16.0"

  name = var.sg.name_cache

  description = "Security group for API Server"
  vpc_id      = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 6379
      to_port                  = 6379
      protocol                 = "tcp"
      description              = "ElastiCache port ingress from API"
      source_security_group_id = module.sg-api.this_security_group_id
    },
    {
      from_port                = 6379
      to_port                  = 6379
      protocol                 = "tcp"
      description              = "ElastiCache port ingress from ADMIN"
      source_security_group_id = module.sg-admin.this_security_group_id
    }
  ]
  egress_cidr_blocks = var.sg.egress
  egress_rules       = ["all-all"]
  tags = {
    Name        = var.sg.name_cache
    Environment = var.vpc.env
    Owner       = var.vpc.owner
  }
}
