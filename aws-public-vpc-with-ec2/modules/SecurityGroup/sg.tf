resource "aws_security_group" "security_group" {
  name = "${var.vpc_name}-SG"
  description = "Jenkins-MasterNode-Security-Group"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.service_ports
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "${var.vpc_name}-SG"
    environment = "${var.environment}"
  }

}