module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc.name
  cidr = var.vpc.cidr

  azs             = var.vpc.azs
  private_subnets = var.vpc.private
  public_subnets  = var.vpc.public

  #Database Subnet Group
  create_database_subnet_group       = true
  create_database_subnet_route_table = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  #Single NAT Gateway
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # VPC endpoint for S3
  enable_s3_endpoint = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = var.ec2.name
  instance_count = var.ec2.ins_count

  ami                    = var.ec2.ami_id
  instance_type          = var.ec2.ins_type
  key_name               = var.ec2.keyname
  monitoring             = var.ec2.is_monitor
  vpc_security_group_ids = [module.web_server_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  #  user_data              = "${"file(install_nginx.sh)"}"
  user_data = data.template_file.user_data.rendered
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

data "template_file" "user_data" {
  template = file("install_nginx.sh")
}
module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = var.sg.name
  description         = "Security group for web-server with HTTP ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = var.sg.ingress
}

resource "aws_db_subnet_group" "db_subnet_gp" {
  name       = var.db_subnet_gp.name
  subnet_ids = [module.vpc.private_subnets]
}
