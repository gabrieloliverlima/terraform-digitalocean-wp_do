# Projeto Terraform - Infraestrutura WordPress na DigitalOcean

Este projeto provisiona automaticamente uma infraestrutura na DigitalOcean para hospedar um ambiente WordPress altamente disponível. Ele utiliza **Terraform** para criar e gerenciar recursos como VPC, Load Balancer, Droplets (máquinas virtuais), banco de dados MySQL e chaves SSH.

## 📌 Funcionalidades
- Criação automática de **VPC** para isolar a infraestrutura.
- **Droplets** para servidores WordPress e NFS.
- **Load Balancer** para distribuir o tráfego entre as VMs.
- **Banco de Dados MySQL** gerenciado na DigitalOcean.
- **Uso de Módulos Terraform** para reutilização e organização do código.

## 📋 Pré-requisitos
Antes de iniciar, certifique-se de ter os seguintes requisitos atendidos:

- Conta na [DigitalOcean](https://www.digitalocean.com/)
- **Terraform** instalado 
- Chave SSH para acessar as máquinas remotas

## 🛠️ Instalação e Uso

### 1️⃣ Clonar o repositório
```sh
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
```

### 2️⃣ Configurar variáveis
Crie um arquivo **terraform.tfvars** e defina as variáveis necessárias:
```hcl
do_token     = "SEU_DIGITALOCEAN_TOKEN"
region       = "nyc1"
wp_vm_count  = 2
vms_ssh      = "SEU_FINGERPRINT_SSH"
```
**Importante:** Não compartilhe seu `do_token` publicamente!

### 3️⃣ Inicializar o Terraform
```sh
terraform init
```

### 4️⃣ Planejar a infraestrutura
```sh
terraform plan
```

### 5️⃣ Aplicar as configurações
```sh
terraform apply -auto-approve
```

### 6️⃣ Obter informações da infraestrutura
Após a criação, os IPs e credenciais serão exibidos:
```sh
echo "Load Balancer IP: $(terraform output stack_lb_ip)"
echo "WordPress VMs: $(terraform output stack_vm_ip)"
echo "Banco de Dados Usuário: $(terraform output stack_database_username)"
```

## 📂 Estrutura do Projeto
```
terraform-project/
│── main.tf              # Configuração principal e módulos
│── variables.tf         # Definição de variáveis
│── outputs.tf           # Saídas da infraestrutura
│── modules/
│   ├── do_wp_stack/     # Módulo de criação de toda a stack para hospedar o Wordpess
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
```

## 🚀 Destruir a Infraestrutura
Se precisar remover todos os recursos criados, execute:
```sh
terraform destroy -auto-approve
```
