module "s3-plus" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.12.0"

  bucket        = var.s3_name
  acl           = var.s3.is_private ? "private" : "public"
  create_bucket = var.s3.bucket_create

  tags = {
    Environment = var.s3.env
    Owner       = var.s3.owner
    Project     = var.s3.project
    Team        = var.s3.team
  }

}
