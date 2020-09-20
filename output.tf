output "Instance Public IP" {
  value       = aws_instance.this.public_ip
  description = "EC2 Instance Public IPv4 ADDRESS"
}
