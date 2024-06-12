#---List all the varaiables that will be used in the project---

#------------ Region-----------------
variable "region-name" {
  description = "Region name"
}

#----------name of the AZ 1-----------
variable "az-1" {
  description = "Availabity Zone 1"
}
#---------- Name of the AZ 2-----------
variable "az-2" {
  description = "Availabity Zone 2"
}
#---------- Name of the AZ 2-----------
variable "az-3" {
  description = "Availabity Zone 3"
}

#----------CIDR Block of the VPC----------
variable "vpc-cidr-block" {
  description = "CIDR Block for VPC"
}

#-----------vpc name-------------
variable "vpc-name" {
  description = "vpc name"
}

#----------CIDR Block of web-subnet1----------
variable "web-subnet1-cidr" {
  description = "CIDR Block for web-subnet1"
}

#-----------web-subnet1 name-------------
variable "web-subnet1-name" {
  description = "web-subnet1 name"
}

#----------CIDR Block of web-subnet2----------
variable "web-subnet2-cidr" {
  description = "CIDR Block for web-subnet2"
}

#-----------web-subnet2 name-------------
variable "web-subnet2-name" {
  description = "web-subnet2 name"
}

#----------CIDR Block of web-subnet3----------
variable "web-subnet3-cidr" {
  description = "CIDR Block for web-subnet3"
}

#-----------web-subnet3 name-------------
variable "web-subnet3-name" {
  description = "web-subnet3 name"
}

#----------CIDR Block of private-subnet1----------
variable "pri-subnet1-cidr" {
  description = "CIDR Block for private subnet1"
}
#-----------private subnet1 name-------------
variable "pri-subnet1-name" {
  description = "private subnet1 name"
}

#----------CIDR Block of private-subnet2----------
variable "pri-subnet2-cidr" {
  description = "CIDR Block for private subnet2"
}
#-----------private subnet1 name-------------
variable "pri-subnet2-name" {
  description = "private subnet2 name"
}

#----------CIDR Block of private-subnet3----------
variable "pri-subnet3-cidr" {
  description = "CIDR Block for private subnet3"
}
#-----------private subnet3 name-------------
variable "pri-subnet3-name" {
  description = "private subnet3 name"
}

#-----------internet gateway name-------------
variable "igw-name" {
  description = "internet gateway name"
}

#-----------public route table name-------------
variable "public-rt-name" {
  description = "public route table name"
}

#-----------private route table name-------------
variable "private-rt-name" {
  description = "private route table name"
}

#-----------database subnet group name-------------
variable "db-subnet-name" {
  description = "database subnet group name"
}

#-----------database security group name-------------
variable "db-sg-name" {
  description = "database security group name"
}

#-----------database name-------------
variable "db-name" {
  description = "database name"
}
#-----------database instance class-------------
variable "db-instance-class" {
  description = "database instance class"
}
#-----------database username-------------
variable "db-username" {
  description = "database username"
}
#-----------database password-------------
variable "db-password" {
  description = "database password"
}

#-----------efs name-------------
variable "my-nfs-name" {
  description = "efs name"
}

#-----------efs security name-------------
variable "efs-sg-name" {
  description = "efs security name"
}

#-----------alb name-------------
variable "alb-name" {
  description = "application lb name"
}

#-----------alb name-------------
variable "alb-sg-name" {
  description = "application lb-sg name"
}

#-----------tg name-------------
variable "tg-web-name" {
  description = "target group name"
}

#-----------asg name-------------
variable "asg-web-name" {
  description = "asg name"
}
#-----------asg security name-------------
variable "asg-sg-web-name" {
  description = "asg security name"
}

#-----------template name-------------
variable "template-web-name" {
  description = "template name"
}

#-----------instance type-------------
variable "instance-type" {
  description = "instance type"
}

#-----------key name-------------
variable "key-name" {
  description = "key name"
}

#-----------instance name-------------
variable "web-instance-name" {
  description = "instance name"
}

#-----------ssm role name-------------
variable "ssm-role-name" {
  description = "ssm role name"
}

#-----------dns name-------------
variable "dns-name" {
  description = "friendly name of alb"
}

#-----------domain name-------------
variable "domain-name" {
  description = "friendly name of alb"
}