# variables for webservers
}
# Instance Type
variable "instance_type" {
  description = "The instance type for the web servers"
  type        = string
  default     = "t2.micro"
}

# AMI ID
variable "ami_id" {
  description = "The AMI ID for the web servers"
  type        = string
  default     = "ami-0ae8f15ae66fe8cda"  # Replace with the AMI ID you need
}

# SSH Key Name
variable "key_name" {
  description = "The name of the SSH key pair to use for accessing the web servers"
  type        = string
  default     = "your-key"  # Replace with your actual key pair name
}

# Security Group Name
variable "web_security_group_name" {
  description = "The name of the security group for web servers"
  type        = string
  default     = "web-sg"
}

# Web Server Tags
variable "web_server_tags" {
  description = "Tags to apply to the web server instances"
  type        = map(string)
  default     = {
    Name = "web-server"
  }
}
