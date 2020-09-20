output "public_ip" {
  value       = module.ec2_cluster.public_ip
  description = "EC2 Instance Public IPv4 ADDRESS"
}
