#-----------------------creation of ALB-----------------------------
resource "aws_lb" "alb" {
  name               = var.alb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group-web.id]
  subnets            = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id, aws_subnet.web-subnet3.id]


  tags = {
    Name = var.alb-name
  }
}

#----------- Creation Security group for web-----------
resource "aws_security_group" "alb-security-group-web" {
  name        = var.alb-sg-name
  description = "ALB Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
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
    Name = var.alb-sg-name
  }
} 

#----------- Creation of the Target Group for the web -----------
resource "aws_lb_target_group" "target-group-web" {
  name     = var.tg-web-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    path    = "/"
    matcher = 200

  }

  tags = {
    Name = var.tg-web-name
  }
}
resource "aws_lb_listener" "alb_listener-web" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-west-2:423678653619:certificate/87b55954-6463-4c5f-9975-f9ffbd41a365"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-web.arn
  }
}

resource "aws_lb_listener" "HTTP_listener-web" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

#-------------------------------creation af a record for alb------------------------------

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.dns-name
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}