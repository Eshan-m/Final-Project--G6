# output for webservers

# Output Web Server 1 Details
output "web_server_1_id" {
  description = "ID of the first web server instance"
  value       = aws_instance.web_1.id
}

output "web_server_1_public_ip" {
  description = "Public IP address of the first web server"
  value       = aws_instance.web_1.public_ip
}

output "web_server_1_public_dns" {
  description = "Public DNS of the first web server"
  value       = aws_instance.web_1.public_dns
}

# Output Web Server 2 Details
output "web_server_2_id" {
  description = "ID of the second web server instance"
  value       = aws_instance.web_2.id
}

output "web_server_2_public_ip" {
  description = "Public IP address of the second web server"
  value       = aws_instance.web_2.public_ip
}

output "web_server_2_public_dns" {
  description = "Public DNS of the second web server"
  value       = aws_instance.web_2.public_dns
}

# Output Web Server 3 Details
output "web_server_3_id" {
  description = "ID of the second web server instance"
  value       = aws_instance.web_3.id
}

output "web_server_3_public_ip" {
  description = "Public IP address of the second web server"
  value       = aws_instance.web_3.public_ip
}

output "web_server_3_public_dns" {
  description = "Public DNS of the second web server"
  value       = aws_instance.web_3.public_dns
}

# Output Web Server 4 Details
output "web_server_4_id" {
  description = "ID of the second web server instance"
  value       = aws_instance.web_4.id
}

output "web_server_4_public_ip" {
  description = "Public IP address of the second web server"
  value       = aws_instance.web_4.public_ip
}

output "web_server_4_public_dns" {
  description = "Public DNS of the second web server"
  value       = aws_instance.web_4.public_dns
}

# Output  Private Web Server 1 Details
output "webprivate_1_id" {
  description = "ID of the second web server instance"
  value       = aws_instance.webprivate_1.id
}

# Output  Private Web Server 2 Details
output "vmprivate_5_id" {
  description = "ID of the second web server instance"
  value       = aws_instance.vmprivate_5.id
}

output "lb_dns_name" {
  value = aws_lb.web_lb.dns_name
}