#Webserver main
# Use remote state to retrieve the data
data "terraform_remote_state" "network" { // This is to use Outputs from Remote State
  backend = "s3"
  config = {
    bucket = "group6-acs"            // Bucket from where to GET Terraform State
    key    = "network/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                       // Region where bucket created
  }
  }
 

# Security Group for Web Servers
resource "aws_security_group" "web_securityg" {
  name        = var.web_security_group_name
  description = "Allow HTTP and SSH inbound"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

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
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
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
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_1_id
  security_groups             = [aws_security_group.web_securityg.id]
  key_name                    = aws_key_pair.web.key_name  # Create the Key by running the command ssh-keygen -t rsa  -f web
  associate_public_ip_address = true

  user_data     = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    service httpd start
    chkconfig httpd on
    echo '<html><p>Welcome to Web Server 1</p></html>' > /var/www/html/index.html
    echo '<html><p>Welcome to Web Server 1 - Group 6 Members: Eshan / Pasindu / Kimuel / Lakshman</p></html>' > /var/www/html/index.html
    echo '<img src="https://group6-acs1.s3.amazonaws.com/1a.jpg" alt="Image from S3">' >> /var/www/html/index.html #Replace with s3 bucket image url
     
  EOF
  
   tags = merge(var.web_server_tags, { Name = "web-server-1" })
   
}


# Launch Web Server in Public Subnet 2
resource "aws_instance" "web_2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_2_id
  security_groups             = [aws_security_group.web_securityg.id]
  key_name                    = aws_key_pair.web.key_name  # Create the Key by running the command ssh-keygen -t rsa  -f web
  associate_public_ip_address = true
 
 
  user_data     = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    service httpd start
    chkconfig httpd on
    echo '<h1>Welcome to Web Server 2</h1>' > /var/www/html/index.html
    echo '<html><p>Welcome to Web Server 2 - Group 6 Members: Eshan / Pasindu / Kimuel / Lakshman</p></html>' > /var/www/html/index.html
    echo '<img src="https://group6-acs1.s3.amazonaws.com/1a.jpg" alt="Image from S3">' >> /var/www/html/index.html #Replace with s3 bucket image url
  EOF
  
  tags = merge(var.web_server_tags, { Name = "BASITION-web-server-2" })
 
}

# Launch Web Server in Public Subnet 3
resource "aws_instance" "web_3" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_3_id
  security_groups             = [aws_security_group.web_securityg.id]
  key_name                    = aws_key_pair.web.key_name  # Create the Key by running the command ssh-keygen -t rsa  -f web
  associate_public_ip_address = true
 
 
  user_data     = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    service httpd start
    chkconfig httpd on
    echo '<h1>Welcome to Web Server 3</h1>' > /var/www/html/index.html
    echo '<html><p>Welcome to Web Server 3 - Group 6 Members: Eshan / Pasindu / Kimuel / Lakshman</p></html>' > /var/www/html/index.html
    echo '<img src="https://group6-acs1.s3.amazonaws.com/1b.jpg" alt="Image from S3">' >> /var/www/html/index.html #Replace with s3 bucket image url
  EOF
  
 
  tags = merge(var.web_server_tags, { Name = "web-server-3" })
}

# Launch Web Server in Public Subnet 4
resource "aws_instance" "web_4" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_4_id
  security_groups             = [aws_security_group.web_securityg.id]
  key_name                    = aws_key_pair.web.key_name  # Create the Key by running the command ssh-keygen -t rsa  -f web
  associate_public_ip_address = true
 
 
  user_data     = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    service httpd start
    chkconfig httpd on
    echo '<h1>Welcome to Web Server 4</h1>' > /var/www/html/index.html
    echo '<html><p>Welcome to Web Server 4 - Group 6 Members: Eshan / Pasindu / Kimuel / Lakshman</p></html>' > /var/www/html/index.html
    echo '<img src="https://group6-acs1.s3.amazonaws.com/1c.jpg" alt="Image from S3">' >> /var/www/html/index.html #Replace with s3 bucket image url
  EOF
  
 tags = merge(var.web_server_tags, { Name = "web-server-4" })
}

# Launch Web Server in Private Subnet 1
resource "aws_instance" "webprivate_1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.network.outputs.private_subnet_1_id
  security_groups             = [aws_security_group.web_securityg.id]
  key_name                    = aws_key_pair.web.key_name  # Create the Key by running the command ssh-keygen -t rsa  -f web
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo yum -y update 
              sudo yum -y install httpd
              echo "<h1>Hello from WebServer 1 - PRS1</h1>" > /var/www/html/index.html
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF
  tags = merge(var.web_server_tags, { Name = "web-server-5" })
  
}

# Launch Web Server in Private Subnet 2
resource "aws_instance" "vmprivate_5" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.network.outputs.private_subnet_2_id
  security_groups             = [aws_security_group.web_securityg.id]
  key_name                    = aws_key_pair.web.key_name  # Create the Key by running the command ssh-keygen -t rsa  -f web
  associate_public_ip_address = true

  tags = merge(var.web_server_tags, { Name = "VM5" })
 
}

# Adding SSH  key to instance
resource "aws_key_pair" "web" {
  key_name   = var.prefix
  public_key = file("${var.prefix}.pub")
}

# Create Target Group for Web Servers
resource "aws_lb_target_group" "web_tg" {
  name        = "${var.prefix}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

# Create the Application Load Balancer
resource "aws_lb" "web_lb" {
  name               = "${var.prefix}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_securityg.id]
  subnets            = [
    data.terraform_remote_state.network.outputs.public_subnet_1_id,
    data.terraform_remote_state.network.outputs.public_subnet_2_id,
    data.terraform_remote_state.network.outputs.public_subnet_3_id
    
  ]

  enable_deletion_protection = false
}

# Create a Listener for the Load Balancer
resource "aws_lb_listener" "web_lb_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

# Attach Instances to the Target Group
resource "aws_lb_target_group_attachment" "web_tg_attachment_1" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_tg_attachment_2" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_tg_attachment_3" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_3.id
  port             = 80
}


/*
# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 1
  max_size             = 4
  min_size             = 1
  launch_configuration = aws_launch_configuration.web_lc.id
  vpc_zone_identifier  = [
    data.terraform_remote_state.network.outputs.public_subnet_1_id,
    data.terraform_remote_state.network.outputs.public_subnet_2_id,
    data.terraform_remote_state.network.outputs.public_subnet_3_id
  ]

  tag {
    key                 = "Name"
    value               = "${var.environment}-web-server"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
# Attach ASG Instances to Target Group
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  lb_target_group_arn    = aws_lb_target_group.web_tg.arn
}
*/