# Fundação de Infraestrutura AWS com Terraform

Este projeto contém a base de infraestrutura para a AWS, projetada para ser modular, escalável e de fácil manutenção. Ele separa os ambientes de **Produção** e **Homologação** utilizando uma estrutura de diretórios e um módulo centralizado.

## Estrutura de Diretórios

```text
terraform/
├── README.md                 # Este arquivo de documentação
├── modules/
│   └── foundation/           # Módulo principal com a lógica da infraestrutura
│       ├── vpc.tf            # Definição da VPC
│       ├── subnets.tf        # Definição de sub-redes (Públicas, App, DB)
│       ├── gateways.tf       # Internet Gateway e NAT Gateway
│       ├── routing.tf        # Tabelas de rotas e associações
│       ├── security_groups.tf # Grupos de segurança (EC2, RDS, EKS, etc.)
│       ├── nacls.tf          # Network ACLs por camada
│       ├── vpc_endpoints.tf  # VPC Endpoints (S3)
│       ├── variables.tf      # Variáveis do módulo
│       └── outputs.tf        # Saídas do módulo
└── environments/
    ├── producao/             # Root do ambiente de Produção
    │   ├── main.tf           # Chamada do módulo foundation
    │   ├── terraform.tfvars.example # Exemplo de valores de variáveis
    │   └── ...               # Arquivos de configuração (providers, versions)
    └── homologacao/          # Root do ambiente de Homologação
        ├── main.tf
        ├── terraform.tfvars.example
        └── ...
```

## Componentes da Fundação

1.  **Rede (VPC & Subnets)**:
    *   1 VPC por ambiente.
    *   **Subnets Públicas (2)**: Para recursos que precisam de acesso externo (ALB, NAT GW).
    *   **Subnets Privadas App (2)**: Para workloads como EC2 e EKS.
    *   **Subnet Privada DB (1)**: Isolada para bancos de dados.
    *   Configuração Multi-AZ para alta disponibilidade.

2.  **Gateways & Roteamento**:
    *   Internet Gateway para saída de tráfego público.
    *   NAT Gateway posicionado em subnet pública para permitir que subnets privadas acessem a internet.
    *   Tabelas de rotas distintas para camadas públicas e privadas.

3.  **Segurança**:
    *   **Network ACLs (NACLs)**: Regras de firewall stateless para cada camada.
    *   **Security Groups**: Placeholders prontos para EC2, EKS, RDS, ECR e Bastion.

4.  **VPC Endpoints**:
    *   Gateway Endpoint para o Amazon S3 (comunicação segura e gratuita dentro da rede AWS).

## Como Utilizar

1.  Acesse o diretório do ambiente desejado (ex: `environments/producao`).
2.  Copie o arquivo `terraform.tfvars.example` para `terraform.tfvars` e preencha os valores conforme sua conta AWS.
3.  Execute os comandos padrão do Terraform:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

## Informações Necessárias para Preenchimento Futuro

Como este projeto é um esqueleto funcional, você precisará definir os seguintes valores nos arquivos `terraform.tfvars`:
*   **CIDR da VPC**: O intervalo de IPs da rede (ex: `10.0.0.0/16`).
*   **CIDRs das Subnets**: Divisões do IP da VPC para cada sub-rede.
*   **Contas AWS**: Se utilizar contas distintas, configure os profiles/roles nos `providers.tf`.
*   **Regras de Firewall**: Adicione regras específicas de entrada/saída nos Security Groups em `modules/foundation/security_groups.tf`.

## Sugestões de Melhorias Futuras

*   **Backend Remoto**: Configurar o estado do Terraform (`tfstate`) no S3 com trava via DynamoDB.
*   **IAM Avançado**: Implementar roles e políticas granulares para serviços.
*   **CloudWatch**: Adicionar VPC Flow Logs para monitoramento de tráfego.
*   **Transit Gateway**: Caso precise conectar múltiplas VPCs ou redes On-premises no futuro.
