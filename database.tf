#------------------------create a database subnet group----------------
resource "aws_db_subnet_group" "db-subnet" {
  name       = var.db-subnet-name
  subnet_ids = [aws_subnet.pri-subnet1.id, aws_subnet.pri-subnet2.id, aws_subnet.pri-subnet3.id]

  tags = {
    Name = var.db-subnet-name
  }
}

#--------------------create a database security-----------------------------------

resource "aws_security_group" "db-sg" {
  name        = var.db-sg-name
  description = "Database security group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.asg-security-group-web.id]
    
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = var.db-sg-name
  }
}



#--------------------create a database instance-----------------------------------
resource "aws_db_instance" "rds-db" {
  allocated_storage      = 10
  db_name                = var.db-name
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db-instance-class
  username               = var.db-username
  password               = var.db-password
  db_subnet_group_name   = aws_db_subnet_group.db-subnet.name
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  multi_az               = true
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
}