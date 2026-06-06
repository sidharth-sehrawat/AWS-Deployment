output "mario_public_ip" {
  value = aws_instance.mario.public_ip
}

output "mario_public_dns" {
  value = aws_instance.mario.public_dns
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}
