output "instance_id" {
  value = aws_instance.on_prem.id
}

output "vpc_id" {
  value = aws_vpc.on_prem_vpc.id
}

output "subnet_id" {
  value = aws_subnet.on_prem_subnet.id
}

output "security_group_id" {
  value = aws_security_group.on_prem_sg.id
}
   