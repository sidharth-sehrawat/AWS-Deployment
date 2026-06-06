resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}-key"
  public_key = file("/home/sid2001sehrawat/.ssh/id_ed25519.pub")
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "mario" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.small"

  subnet_id = aws_subnet.public_a.id

  vpc_security_group_ids = [
    aws_security_group.mario.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  key_name = aws_key_pair.main.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash

  dnf update -y

  dnf install -y docker

  systemctl enable docker
  systemctl start docker

  usermod -aG docker ec2-user

  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

  cd /tmp
  unzip awscliv2.zip
  ./aws/install

  EOF  

  tags = {
    Name = "${var.project_name}-mario"
  }
}
