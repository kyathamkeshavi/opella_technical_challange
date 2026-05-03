# 🚀 Azure Infrastructure Deployment using Terraform

## 📌 Overview

This project provisions Azure infrastructure using Terraform with a modular and environment-based architecture. It also includes CI/CD automation using GitHub Actions and secure state management using Azure Storage backend.

---

## 🧱 Architecture Components

* Virtual Network (VNet)
* Subnet
* Network Security Group (NSG)
* Linux Virtual Machine (VM)
* Azure Key Vault
* Remote Backend (Azure Storage Account)

---

## 📁 Project Structure

```
opella_technical_challange/
│
├── bootstrap/
│   ├── main.tf
│   ├── provider.tf
│   ├── outputs.tf
│   └── .terraform.lock.hcl
│
├── envs/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   │
│   └── prod/
│       ├── backend.tf
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
├── modules/
│   ├── vnet/
│   ├── nsg/
│   ├── vm/
│   └── keyvault/
│
├── .github/workflows/
│   └── terraform.yml
│
├── .gitignore
└── README.md
```

---

## ⚙️ Key Features

* Modular Terraform design (reusable modules)
* Environment-based deployment (dev & prod)
* CI/CD pipeline using GitHub Actions
* Remote backend for secure state management
* Infrastructure as Code (IaC) best practices

---

## 🔁 CI/CD Pipeline (GitHub Actions)

The project includes an automated pipeline using GitHub Actions:

### 🔹 Pipeline Stages

* Checkout code
* Setup Terraform
* Terraform Init
* Terraform Plan
* Terraform Apply (optional/manual approval)

### 🔹 Benefits

* Automated deployments
* Consistent infrastructure provisioning
* Reduced manual errors
* Easy integration with version control

---

## 💾 Remote Backend (Azure Storage)

Terraform state is stored securely in Azure Storage instead of local files.

### 🔹 Advantages

* Centralized state management
* Prevents state file conflicts
* Secure storage of sensitive data
* Enables team collaboration

### 🔹 Backend Configuration Example

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatestorage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
```

---

## 🧩 Modules Description

### 🔹 VNet Module

* Creates Virtual Network and Subnet

### 🔹 NSG Module

* Creates Network Security Group
* Defines inbound rules (e.g., SSH access)

### 🔹 VM Module

* Deploys Linux Virtual Machine
* Attaches network interface

### 🔹 Key Vault Module

* Creates Azure Key Vault
* Used for secure secret storage

---

## 🌍 Environments

### Dev

* Used for development and testing

### Prod

* Production-ready infrastructure

---

## 🔧 Prerequisites

* Terraform installed
* Azure CLI installed
* Azure Subscription
* Logged in via:

  ```
  az login
  ```

---

## ▶️ Deployment Steps

### Step 1: Initialize

```
cd envs/dev
terraform init
```

### Step 2: Plan

```
terraform plan
```

### Step 3: Apply

```
terraform apply
```

---

## 🔐 Security Best Practices

* Do NOT commit `.tfstate` files
* Store state in remote backend
* Avoid hardcoding credentials
* Use `.gitignore` to exclude sensitive files

---

## 📌 Achievements

* Implemented modular Terraform architecture
* Integrated CI/CD using GitHub Actions
* Configured remote backend for state management
* Designed reusable and scalable infrastructure

---

## 🚀 Future Enhancements

* Add autoscaling for VM
* Use Azure Key Vault for secrets
* Integrate monitoring (Prometheus & Grafana)
* Use SSH keys instead of passwords
* Add Terraform validation & linting in pipeline

---

## 👩‍💻 Author

Keshavi
