module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = var.sg.name
  description         = "Security group for web-server with HTTP ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = var.sg.ingress
}

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 3.0"

  name        = var.sg.name
  description = "Security group for SSH For Remote Execution"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.sg.ingress
}
