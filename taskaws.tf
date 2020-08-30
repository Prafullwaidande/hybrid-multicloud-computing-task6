provider "aws" {
  region = "ap-south-1"
}

resource "aws_db_instance" "db" {
 
  engine            = "mysql"
  engine_version    = "5.7.30"
  instance_class    = "db.t2.micro"
  allocated_storage = 10
  name     = "mydb"
  username = "wordpress_user"
  password = "rootroot"
  port     = "3306"
  publicly_accessible = true
  iam_database_authentication_enabled = true
  vpc_security_group_ids = ["sg-041bf4230a162e"]
  tags = {
     Name = "mysql"
 }
}