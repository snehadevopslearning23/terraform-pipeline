resource "aws_instance" "myserver" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "prod-server-${count.index + 1}"

  }
}


