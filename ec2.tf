data "template_file" "user_data" {
  template = file("install_nginx.sh")
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = var.ec2.name
  instance_count = var.ec2.ins_count

  ami                    = var.ec2.ami_id
  instance_type          = var.ec2.ins_type
  key_name               = var.ec2.keyname
  monitoring             = var.ec2.is_monitor
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, module.web_server_sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = data.template_file.user_data.rendered
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
