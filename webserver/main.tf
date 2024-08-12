#Webserver main
# Security Group for Web Servers
resource "aws_security_group" "web_sg" {
  name        = var.web_security_group_name
  description = "Allow HTTP and SSH inbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.web_security_group_name
  }
}

# Launch Web Server in Public Subnet 1
resource "aws_instance" "web_1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_1.id
  security_groups             = [aws_security_group.web_sg.name]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "web-server-1" })

  provisioner "file" {
    source      = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  }
}

# Launch Web Server in Public Subnet 2
resource "aws_instance" "web_2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_2.id
  security_groups             = [aws_security_group.web_sg.name]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "BASITION-web-server-2" })

  provisioner "file" {
    source      = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  }
}

# Launch Web Server in Public Subnet 3
resource "aws_instance" "web_3" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_3.id
  security_groups             = [aws_security_group.web_sg.name]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "web-server-3" })

 /* provisioner "file" {
    source      = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  }
  */
}

# Launch Web Server in Public Subnet 4
resource "aws_instance" "web_4" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_4.id
  security_groups             = [aws_security_group.web_sg.name]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "web-server-4" })

 /* provisioner "file" {
    source      = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
 }
  */
}

# Launch Web Server in Private Subnet 1
resource "aws_instance" "webprivate_1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet_1.id
  security_groups             = [aws_security_group.web_sg.name]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "web-server-5" })

 /* provisioner "file" {
    source      = "index.html"
    destination = "/var/www/html/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
 }
  */
}

# Launch Web Server in Private Subnet 2
resource "aws_instance" "vmprivate_5" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet_2.id
  security_groups             = [aws_security_group.web_sg.name]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "VM5" })
 
}