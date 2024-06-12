#----------------------create efs-------------------------
resource "aws_efs_file_system" "my-nfs" {
  creation_token = var.my-nfs-name

  tags = {
    Name = var.my-nfs-name
  }
}

#------------------------create efs security------------------------

resource "aws_security_group" "efs-sg" {
  name        = var.efs-sg-name
  description = "efs security group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 2049
    to_port          = 2049
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
    Name = var.efs-sg-name
  }
}



#--------------------Mounting a efs------------------------------
resource "aws_efs_mount_target" "efs-mount-target1" {
  file_system_id = aws_efs_file_system.my-nfs.id
  subnet_id      = aws_subnet.pri-subnet1.id
   security_groups = [aws_security_group.efs-sg.id]
}

resource "aws_efs_mount_target" "efs-mount-target2" {
  file_system_id = aws_efs_file_system.my-nfs.id
  subnet_id      = aws_subnet.pri-subnet2.id
   security_groups = [aws_security_group.efs-sg.id]
}

resource "aws_efs_mount_target" "efs-mount-target3" {
  file_system_id = aws_efs_file_system.my-nfs.id
  subnet_id      = aws_subnet.pri-subnet3.id
   security_groups = [aws_security_group.efs-sg.id]
}