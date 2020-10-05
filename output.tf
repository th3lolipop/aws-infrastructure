output "bucket_url" {
  value       = module.s3-plus.this_s3_bucket_bucket_regional_domain_name
  description = "AWS S3 Bucket URL with Region"
}

output "sqs_url" {
  value       = module.sqs.this_sqs_queue_id
  description = "The URL of AWS SQS Queue"
}
