#-----------AutoScaling Group for web-------------
resource "aws_autoscaling_group" "asg-web" {
  name                = var.asg-web-name
  desired_capacity    = 3
  max_size            = 6
  min_size            = 2
  target_group_arns   = [aws_lb_target_group.target-group-web.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id, aws_subnet.web-subnet3.id]


  launch_template {
    id      = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }
}
#---------- AutoScaling Security Group for the Web------------
resource "aws_security_group" "asg-security-group-web" {
  name        = var.asg-sg-web-name
  description = "ASG Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-security-group-web.id]
  }

  ingress {
    description = "SSH From Anywhere or Your-IP"
    from_port   = 22
    to_port     = 22
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
    Name = var.asg-sg-web-name
  }
}
#-------------Launch template for web-------------
resource "aws_launch_template" "template-web" {
  name          = var.template-web-name
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance-type
  key_name      = var.key-name

  iam_instance_profile {

   name = data.aws_iam_instance_profile.ssm-role.name
   
  }

  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg-security-group-web.id]
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Welcome to the web 3-tier Application launch via Terraform by $(hostname -f) </h1>" > /var/www/html/index.html
    EOF
  )



  tag_specifications {

    resource_type = "instance"
    tags = {
      Name = var.web-instance-name
    }
  }
}