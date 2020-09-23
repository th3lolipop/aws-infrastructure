module "rds" {
  source                  = "terraform-aws-modules/rds/aws"
  version                 = "2.18.0"
  identifier              = var.rds.name
  engine                  = var.rds.engine
  engine_version          = var.rds.version
  instance_class          = var.rds.instance_class
  allocated_storage       = var.rds.storage
  storage_encrypted       = var.rds.encrypted
  name                    = var.rds.dbname
  username                = var.rds.username
  password                = var.rds.password
  port                    = var.rds.port
  vpc_security_group_ids  = "sg-00fc33d942da5041b"
  maintenance_window      = var.rds.maintenance_window
  backup_window           = var.rds.backup_window
  backup_retention_period = var.rds.backup_retention_period
  subnet_ids              = module.vpc.database_subnets
  family                  = var.rds.family
  major_engine_version    = var.rds.major_engine_version
  deletion_protection     = var.rds.is_del_protect

  tags = {
    Name        = var.rds.name
    Environment = var.rds.env
    Entity      = var.rds.entity
  }
}
