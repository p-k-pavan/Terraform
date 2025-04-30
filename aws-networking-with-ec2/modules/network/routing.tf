resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.vpc_name}-RT"
    environment = "${var.environment}"
  }

}

resource "aws_route_table_association" "public-route-table-association" {
  count = length(var.public_cidr_block)
  subnet_id = element(aws_subnet.public-subnets.*.id,count.index)
  route_table_id = aws_route_table.public-route-table.id

}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.natgw_id
  }

  tags = {
    Name = "${var.vpc_name}-PRIVATE-RT"
    environment = "${var.environment}"
  }

}

resource "aws_route_table_association" "route-table-association" {
  count = length(var.private_cidr_block)
  subnet_id = element(aws_subnet.private-subnets.*.id,count.index)
  route_table_id = aws_route_table.private-route-table.id

}