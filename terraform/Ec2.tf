resource "aws_instance" "on_prem" {
  ami                    = "ami-019715e0d74f695be"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.on_prem_public.id
  vpc_security_group_ids = [aws_security_group.on_prem_sg.id]
  key_name               = "mykey"

  tags = {
    Name = "OnPrem-Migrated-App"
  }
}