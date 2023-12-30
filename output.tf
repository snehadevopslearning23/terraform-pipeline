output "public_ip" {
  value = aws_instance.myserver[*].public_ip
}

output "id" {
  value = aws_instance.myserver[*].id
}

output "private_ip" {
  value = aws_instance.myserver[*].private_ip
}