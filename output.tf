output "public_ip" {
  value       = module.ec2.public_ip
  description = "EC2 Instance Public IPv4 ADDRESS"
}

output "rds_endpoint" {
  value       = module.rds.this_db_instance_endpoint
  description = "RDS Endpoint Name"
}

output "bucket_url" {
  value       = module.s3-plus.this_s3_bucket_bucket_regional_domain_name
  description = "AWS S3 Bucket URL with Region"
}
