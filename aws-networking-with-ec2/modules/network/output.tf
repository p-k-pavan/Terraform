output "vpc_name" {
  value = var.vpc_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "environment" {
  value = var.environment
}

output "public_subnet_id" {
  value = "${aws_subnet.public-subnets.*.id}"
}

output "private_subnet_id" {
  value = "${aws_subnet.private-subnets.*.id}"
}

output "public_subnet_id_01" {
  value = "${aws_subnet.public-subnets.0.id}"
}

output "private_subnet_id_01" {
  value = "${aws_subnet.private-subnets.0.id}"
}