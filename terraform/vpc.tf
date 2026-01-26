# VPC
resource "aws_vpc" "on_prem_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "on_prem_vpc"
  }
}
# Subnet
resource "aws_subnet" "on_prem_subnet" {
  vpc_id                  = aws_vpc.on_prem_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "on_prem_Subnet"
  }
}

# Create Public Subnet in ap-south-1b
resource "aws_subnet" "on_prem_public" {
  vpc_id                  = aws_vpc.on_prem_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = { Name = "on_prem_public" }
}

# Internet Gateway
resource "aws_internet_gateway" "on_prem_igtw" {
  vpc_id = aws_vpc.on_prem_vpc.id
  tags = {
    Name = "on_prem_igtw"
  }
}

# Route Table
resource "aws_route_table" "on_prem_rt" {
  vpc_id = aws_vpc.on_prem_vpc.id
  tags = {
    Name = "on_prem_rt"
  }
}

# Route for Internet Access
resource "aws_route" "on_prem_route" {
  route_table_id         = aws_route_table.on_prem_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.on_prem_igtw.id
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "on_prem_route_assoc" {
  subnet_id      = aws_subnet.on_prem_subnet.id
  route_table_id = aws_route_table.on_prem_rt.id
}

# Associate Route Table with Subnet B
resource "aws_route_table_association" "on_prem_route_assoc_public" {
  subnet_id      = aws_subnet.on_prem_public.id
  route_table_id = aws_route_table.on_prem_rt.id
}


# Security Group
resource "aws_security_group" "on_prem_sg" {
  name        = "on_prem_sec_gp"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.on_prem_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "on_prem_sec_gp"
  }
}