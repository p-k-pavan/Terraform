resource "aws_subnet" "subnets" {
  count = length(var.cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-Subnet-${count.index + 1}"
    environment = "${var.environment}"
  }
}