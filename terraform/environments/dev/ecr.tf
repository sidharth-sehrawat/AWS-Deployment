resource "aws_ecr_repository" "mario" {
  name = "mario"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "mario"
  }
}
