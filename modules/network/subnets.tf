resource "aws_subnet" "public_web" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}
