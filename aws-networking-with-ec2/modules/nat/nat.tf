resource "aws_eip" "nat-eip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id = var.public_subnet_id

  tags = {
    Name = "${var.vpc_name}-NatGateWay"
  }
}