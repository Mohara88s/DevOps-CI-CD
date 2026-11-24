variable "ecr_name" {
  description = "Назва репозиторію Amazon ECR"
  type        = string
}

variable "scan_on_push" {
  description = "Увімкнути автоматичне сканування образів під час push"
  type        = bool
  default     = true
}

variable "image_tag_mutability" {
  description = "Чи дозволено перезаписувати теги образів (MUTABLE або IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "allowed_principal_arns" {
  description = "Список ARN IAM-користувачів або ролей з доступом до репозиторію (порожній список — доступ лише для поточного акаунта)"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Теги для ресурсів ECR"
  type        = map(string)
  default     = {}
}