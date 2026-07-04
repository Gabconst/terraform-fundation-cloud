variable "project_name" {
  description = "Nome do projeto para fins de tag e organização"
  type        = string
}

variable "environment" {
  description = "Nome do ambiente (ex: producao, homologacao)"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC"
  type        = string
}

variable "availability_zones" {
  description = "Lista de AZs para distribuição das subnets"
  type        = list(string)
}

variable "public_subnets_cidrs" {
  description = "Lista de CIDRs para as subnets públicas"
  type        = list(string)
}

variable "private_app_subnets_cidrs" {
  description = "Lista de CIDRs para as subnets privadas de aplicação"
  type        = list(string)
}

variable "private_db_subnets_cidrs" {
  description = "Lista de CIDRs para as subnets privadas de banco de dados"
  type        = list(string)
}
