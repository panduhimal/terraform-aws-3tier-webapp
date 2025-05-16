resource "aws_subnet" "public_web" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnets[count.index].cidr_block
  availability_zone       = var.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnets[count.index].name
  }
}
