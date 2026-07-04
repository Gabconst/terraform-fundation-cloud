# Subnets Públicas
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnets_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "public"
  }
}

# Subnets Privadas de Aplicação
resource "aws_subnet" "private_app" {
  count             = length(var.private_app_subnets_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_app_subnets_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-app-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "private-app"
  }
}

# Subnets Privadas de Banco de Dados
resource "aws_subnet" "private_db" {
  count             = length(var.private_db_subnets_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_db_subnets_cidrs[count.index]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-db-subnet-${count.index + 1}"
    Environment = var.environment
    Tier        = "private-db"
  }
}
