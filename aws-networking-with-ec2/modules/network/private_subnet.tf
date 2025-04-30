resource "aws_subnet" "private-subnets" {
  count = length(var.private_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-Private-Subnet-${count.index + 1}"
    environment = "${var.environment}"
  }
}