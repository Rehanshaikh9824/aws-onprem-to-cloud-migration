resource "aws_db_subnet_group" "rds_subnet" {
  name = "rds-subnet-group"

  subnet_ids = [
    aws_subnet.on_prem_subnet.id,
    aws_subnet.on_prem_public.id
  ]
}

resource "aws_db_instance" "mysql" {
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "Admin123"
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
}
