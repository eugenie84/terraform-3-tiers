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