output "mario_public_ip" {
  value = aws_instance.mario.public_ip
}

output "mario_public_dns" {
  value = aws_instance.mario.public_dns
}
