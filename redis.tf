resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.ec.name
  engine               = var.ec.engine
  node_type            = var.ec.n_type
  num_cache_nodes      = var.ec.num_cluster
  subnet_group_name    = module.vpc.elasticache_subnet_group_name
  security_group_ids   = [module.sg-cache.this_security_group_id]
  parameter_group_name = var.ec.para_name
  engine_version       = var.ec.engine_ver
  port                 = var.ec.engine_port
  apply_immediately    = var.ec.apply

  tags = {
    Name        = var.ec.name
    Environment = var.ec.env
    Project     = var.ec.project
    Owner       = var.ec.owner
  }
}
