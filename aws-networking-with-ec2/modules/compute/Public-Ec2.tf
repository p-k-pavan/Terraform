resource "aws_instance" "pub-server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.sg-id]
  associate_public_ip_address = true

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    delete_on_termination = true
  }

  tags = {
    Name = "${var.vpc_name}-Public-Server"
    environment = "${var.environment}"
  }
}