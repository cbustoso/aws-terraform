output "URL_WEB"  {
  description = "DNS pública del servidor"
  value       = "http://${aws_instance.servidor_1.public_dns}:${var.puerto_servidor}"
}

output "dns_publica_server2" {
  description = "SSH Connect"
  value       = "ssh@${aws_instance.servidor_1.public_dns}"
}