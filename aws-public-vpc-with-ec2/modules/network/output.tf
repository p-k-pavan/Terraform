output "vpc_name" {
  value = var.vpc_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "environment" {
  value = var.environment
}

output "subnet_id" {
  value = "${aws_subnet.subnets.*.id}"
}

output "subnet_id_01" {
  value = "${aws_subnet.subnets.0.id}"
}