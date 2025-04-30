resource "aws_route_table" "route-table" {
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

resource "aws_route_table_association" "route-table-association" {
  count = length(var.cidr_block)
  subnet_id = element(aws_subnet.subnets.*.id,count.index)
  route_table_id = aws_route_table.route-table.id

}