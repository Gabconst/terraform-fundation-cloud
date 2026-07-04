# Security Group para EC2
resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-${var.environment}-ec2-sg"
  description = "Security Group para instancias EC2"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-sg"
    Environment = var.environment
  }
}

# Security Group para RDS
resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security Group para banco de dados RDS"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds-sg"
    Environment = var.environment
  }
}

# Security Group para EKS
resource "aws_security_group" "eks" {
  name        = "${var.project_name}-${var.environment}-eks-sg"
  description = "Security Group para cluster EKS"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-eks-sg"
    Environment = var.environment
  }
}

# Security Group para ECR
resource "aws_security_group" "ecr" {
  name        = "${var.project_name}-${var.environment}-ecr-sg"
  description = "Security Group para acesso ao ECR"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-ecr-sg"
    Environment = var.environment
  }
}

# Security Group para Bastion
resource "aws_security_group" "bastion" {
  name        = "${var.project_name}-${var.environment}-bastion-sg"
  description = "Security Group para Bastion Host"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-bastion-sg"
    Environment = var.environment
  }
}
