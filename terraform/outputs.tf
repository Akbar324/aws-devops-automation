output "web_server_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web_server.public_ip
}

output "web_server_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web_server.id
}
