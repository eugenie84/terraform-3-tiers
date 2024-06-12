data "aws_iam_instance_profile" "ssm-role" {
  name = var.ssm-role-name
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_route53_zone" "primary" {
  name = var.domain-name
}