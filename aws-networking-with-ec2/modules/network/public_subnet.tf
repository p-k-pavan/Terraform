resource "aws_subnet" "public-subnets" {
  count = length(var.public_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-Public-Subnet-${count.index + 1}"
    environment = "${var.environment}"
  }
}