#-----------Create vpc--------------
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr-block 
  tags = {
    Name = var.vpc-name
  }
}
#-----------Creation of three public subnet or web subnet--------------
resource "aws_subnet" "web-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.web-subnet1-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.web-subnet1-name 
  }
}

resource "aws_subnet" "web-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.web-subnet2-cidr
  availability_zone       = var.az-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.web-subnet2-name 
  }
}

resource "aws_subnet" "web-subnet3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.web-subnet3-cidr
  availability_zone       = var.az-3
  map_public_ip_on_launch = true

  tags = {
    Name = var.web-subnet3-name 
  }
}

#-----------Creation of three private subnet--------------
resource "aws_subnet" "pri-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri-subnet1-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = false

  tags = {
    Name = var.pri-subnet1-name 
  }
}

resource "aws_subnet" "pri-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri-subnet2-cidr
  availability_zone       = var.az-2
  map_public_ip_on_launch = false

  tags = {
    Name = var.pri-subnet2-name 
  }
}

resource "aws_subnet" "pri-subnet3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri-subnet3-cidr
  availability_zone       = var.az-3
  map_public_ip_on_launch = false

  tags = {
    Name = var.pri-subnet3-name 
  }
}

#-------------create internet gateway-------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw-name
  }
}

#----------------create a public route table-----------------------------
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public-rt-name
  }
}
#----------Association of public subnets to the public route table
resource "aws_route_table_association" "pub-rt-asscociation-1" {
  subnet_id      = aws_subnet.web-subnet1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "pub-rt-asscociation-2" {
  subnet_id      = aws_subnet.web-subnet2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "pub-rt-asscociation-3" {
  subnet_id      = aws_subnet.web-subnet3.id
  route_table_id = aws_route_table.public-rt.id
}

#----------------create a private route table-----------------------------
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = var.vpc-cidr-block 
#     gateway_id = aws_internet_gateway.igw.id
#   }

  tags = {
    Name = var.private-rt-name
  }
}
#----------Association of private subnets to the private route table
resource "aws_route_table_association" "pri-rt-asscociation-1" {
  subnet_id      = aws_subnet.pri-subnet1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "pri-rt-asscociation-2" {
  subnet_id      = aws_subnet.pri-subnet2.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "pri-rt-asscociation-3" {
  subnet_id      = aws_subnet.pri-subnet3.id
  route_table_id = aws_route_table.private-rt.id
}
