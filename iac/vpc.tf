resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "public" {
  count           = length(var.public_subnet_cidr_blocks)
  vpc_id          = aws_vpc.main.id
  cidr_block      = var.public_subnet_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_subnet" "private" {
  count           = length(var.private_subnet_cidr_blocks)
  vpc_id          = aws_vpc.main.id
  cidr_block      = var.private_subnet_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_nat_gateway" "nat" {
  count = length(aws_subnet.public)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
}

resource "aws_eip" "nat" {
  count = length(aws_subnet.public)
  vpc   = true
}