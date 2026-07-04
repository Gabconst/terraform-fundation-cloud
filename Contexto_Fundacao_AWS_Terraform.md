# Contexto para Criação da Fundação AWS com Terraform

Com base nas melhores práticas e na documentação oficial da AWS, preciso
que você projete uma fundação de infraestrutura utilizando Terraform,
seguindo uma estrutura profissional, modular, organizada e de fácil
manutenção.

## Objetivo

Criar uma fundação reutilizável para AWS, separada em dois ambientes
(**Produção** e **Homologação**), que servirá como base permanente da
infraestrutura.

## Estrutura esperada

-   Um módulo Terraform para Produção.
-   Um módulo Terraform para Homologação.
-   Estrutura preparada para utilização em contas AWS distintas.
-   Região: **us-east-1 (Norte da Virgínia)**.

## Rede

Cada ambiente deve possuir:

-   1 VPC.
-   2 sub-redes públicas.
-   2 sub-redes privadas para aplicações.
-   1 sub-rede privada exclusiva para banco de dados.
-   Arquitetura Multi-AZ.
-   Internet Gateway.
-   NAT Gateway corretamente associado à subnet pública.
-   Route Tables pública e privada.
-   Associações corretas entre sub-redes e Route Tables.
-   VPC Endpoint para comunicação privada entre serviços AWS.
-   Network ACLs por subnet.
-   Security Groups separados por tipo de serviço (EC2, EKS, RDS, ECR e
    demais serviços essenciais).

## Importante

Ainda não possuo contas AWS, CIDRs, IPs nem regras de firewall. Utilize
placeholders e variáveis para todos esses valores.

## Entregáveis

-   Estrutura completa do projeto Terraform.
-   Código modular.
-   README detalhado.
-   Organização de diretórios.
-   Explicação dos módulos.
-   Lista das informações que deverão ser preenchidas futuramente.

## Escopo

A fundação deve criar apenas a infraestrutura base (rede e segurança).
Não deve provisionar workloads.

## IAM

Mantenha apenas a estrutura mínima necessária. A modelagem completa de
IAM será feita posteriormente.

## Boas práticas

-   Código modular.
-   providers.tf
-   versions.tf
-   variables.tf
-   outputs.tf
-   locals.tf quando necessário.
-   terraform.tfvars.example.
-   Backend remoto preparado (comentado).
-   Padrão de tags.
-   Compatibilidade com Terraform 1.x.
