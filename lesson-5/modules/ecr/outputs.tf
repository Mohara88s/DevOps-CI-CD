output "repository_url" {
  description = "URL репозиторію Amazon ECR для push/pull Docker-образів"
  value       = aws_ecr_repository.main.repository_url
}

output "repository_arn" {
  description = "ARN репозиторію Amazon ECR"
  value       = aws_ecr_repository.main.arn
}

output "repository_name" {
  description = "Назва репозиторію Amazon ECR"
  value       = aws_ecr_repository.main.name
}