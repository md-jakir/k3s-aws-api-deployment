resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name = "dev_internet_gateway"
    }
  )
}

resource "aws_subnet" "public" {
  count           = length(var.public_subnet_cidr_blocks)
  vpc_id          = aws_vpc.main.id
  cidr_block      = var.public_subnet_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(var.tags, { Name = "public-subnet" })
}

resource "aws_subnet" "private" {
  count           = length(var.private_subnet_cidr_blocks)
  vpc_id          = aws_vpc.main.id
  cidr_block      = var.private_subnet_cidr_blocks[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(var.tags, { Name = "private-subnet" })
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name = "public_route_table"
    }
  )
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_nat_gateway" "natgw" {
  count = length(aws_subnet.public)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    var.tags,
    {
      Name = "dev_nat_gateway"
    }
  )
}

resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name = "private-route-table"
    }
  )
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rtb.id
}

resource "aws_eip" "nat" {
  count = length(aws_subnet.public)
  vpc   = true

    tags = merge(
    var.tags,
    {
      Name = "nat_eip"
    }
  )
}