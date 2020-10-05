module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.18.0"
  depends_on = [
    module.vpc,
  ]

  identifier     = var.rds.name
  engine         = var.rds.engine
  engine_version = var.rds.version
  instance_class = var.rds.instance_class

  #Storage
  storage_type      = var.rds.storage_type
  allocated_storage = var.rds.storage
  storage_encrypted = var.rds.encrypted

  #Credentials
  name     = var.rds.dbname
  username = var.rds.username
  password = var.rds.password
  port     = var.rds.port

  #Configuration
  multi_az                   = var.rds.multi_az
  publicly_accessible        = var.rds.public_access
  vpc_security_group_ids     = [module.sg-db.this_security_group_id]
  maintenance_window         = var.rds.maintenance_window
  backup_window              = var.rds.backup_window
  backup_retention_period    = var.rds.backup_retention_period
  subnet_ids                 = module.vpc.database_subnets
  family                     = var.rds.family
  major_engine_version       = var.rds.major_engine_version
  deletion_protection        = var.rds.is_del_protect
  auto_minor_version_upgrade = var.rds.allow_minor

  #Subnet Group
  #db_subnet_group_name   = module.vpc.database_subnet_group
  #create_db_subnet_group = var.rds.subnet_gp_create


  tags = {
    Name        = var.rds.name
    Environment = var.rds.env
    Owner       = var.rds.owner
  }
}
