variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "fundacao-aws"
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "producao"
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Lista de Zonas de Disponibilidade (AZs)"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_cidrs" {
  description = "Lista de CIDRs para as subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnets_cidrs" {
  description = "Lista de CIDRs para as subnets privadas de aplicação"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "private_db_subnets_cidrs" {
  description = "Lista de CIDRs para as subnets privadas de banco de dados"
  type        = list(string)
  default     = ["10.0.20.0/24"]
}
