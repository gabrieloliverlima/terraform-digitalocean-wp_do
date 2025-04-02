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


## 🚀 Publicação do Módulo no Terraform Registry
Se desejar disponibilizar este módulo no [Terraform Registry](https://registry.terraform.io/), siga os passos abaixo:

### 1️⃣ Criar um repositório no GitHub
- O nome do repositório deve seguir o padrão `terraform-<PROVIDER>-<NOME_DO_MODULO>`
- Exemplo: `terraform-digitalocean-wp-stack`

### 2️⃣ Estruturar os arquivos do módulo
- O módulo deve conter um `main.tf`, `variables.tf`, `outputs.tf` e um `README.md`

### 3️⃣ Criar uma versão do módulo
- Utilize **tags** no GitHub para definir versões do módulo, por exemplo:
```sh
git tag v1.0.0
```
- Suba a tag para o repositório remoto:
```sh
git push origin v1.0.0
```

### 4️⃣ Publicar no Terraform Registry
- O módulo será automaticamente detectado se estiver no formato correto e público.
- Confirme a publicação no [Terraform Registry](https://registry.terraform.io/)

### 5️⃣ Utilizar o módulo publicado
Uma vez publicado, o módulo pode ser utilizado em qualquer projeto Terraform:
```hcl
module "wp_stack" {
  source      = "github.com/seu-usuario/terraform-digitalocean-wp-stack"
  wp_vm_count = var.wp_vm_count
  region      = var.region
  vms_ssh     = var.vms_ssh
}
```
## 🚀 Destruir a Infraestrutura
Se precisar remover todos os recursos criados, execute:
```sh
terraform destroy -auto-approve
```
