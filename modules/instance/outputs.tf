output "web_instance_public_ip" {
  description = "Public IP address of the web instance."
  value       = aws_instance.web.public_ip
}

output "web_instance_public_dns" {
  description = "Public DNS name of the web instance."
  value       = aws_instance.web.public_dns
}

output "web_instance_subnet_id" {
  value = aws_instance.web.subnet_id
}
