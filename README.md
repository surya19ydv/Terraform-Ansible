# 🚀 Terraform + Ansible AWS EC2 Automation Project

---

## 📌 Project Overview

This project demonstrates how to provision infrastructure using **Terraform** and configure it using **Ansible**.

* **Terraform** → Creates AWS EC2 infrastructure
* **Shell Script (`nginx_install.sh`)** → Installs Nginx during instance creation
* **Ansible** → Configures server & deploys website

⚡ This project includes **multiple approaches**:

1. Using **user-data script (.sh)**
2. Using **Ansible playbook (manual execution from local machine)**

---

## 🏗️ Complete Project Structure (Detailed)

```
## 🏗️ Complete Project Structure (Detailed)
Terraform_folder/
├── Terraform-Aws-EC2/
│
│   ├── provider.tf
│   │   → AWS provider configuration
│
│   ├── terraform.tf
│   │   → Terraform settings & required providers
│
│   ├── variable.tf
│   │   → Input variables (AMI, instance type)
│
│   ├── ec2.tf
│   │   → EC2 + Security Group creation
│
│   ├── output.tf
│   │   → Outputs (Public IP, Instance ID)
│
│   ├── nginx_install.sh
│   │   → Installs Nginx using user-data script
│
│   ├── terra-key (⚠️ DO NOT PUSH)
│   ├── terra-key.pub
│
│   ├── terraform.tfstate (⚠️ DO NOT PUSH)
│   ├── terraform.tfstate.backup
│
│   └── Ansible-project/
│
│       ├── inventory.ini
│       │   → Target EC2 IP & SSH config
│
│       ├── playbook.yml
│       │   → Nginx install + start + deploy site
│
│       ├── index.html
│       │   → Custom webpage
---

## ⚙️ Technologies Used

* Terraform (IaC)
* AWS EC2
* Ansible
* Linux (Ubuntu)
* Nginx

---

## 💻 Local Setup (Windows + WSL)

This project is executed using **WSL (Windows Subsystem for Linux)**.

### Install required tools:

```bash
sudo apt update
sudo apt install ansible -y
sudo apt install unzip -y
```

### Install Terraform:

```bash
wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
unzip terraform_1.0.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```

---

## 🔑 Prerequisites

Before running this project, ensure you have:

- AWS Account
- AWS CLI installed & configured (`aws configure`)
- Terraform installed
- VS Code (or any code editor)
- SSH Key Pair (`terra-key`)
- Basic knowledge of AWS & Linux

---

## 🏗️ Infrastructure Created

Using Terraform, the following resources are created:

- Default VPC
- Security Group (Ports 22 & 80 open)
- EC2 Instance
- Key Pair attachment
- Multiple resources using `count` and `for_each`
- Resource dependency using `depends_on`

---

## ⚙️ Terraform Commands

```bash
terraform init       # Initialize project
terraform validate   # Validate configuration
terraform plan       # Preview changes
terraform apply      # Create infrastructure
## 🌐 Step 2: Connect to EC2

🧠 Terraform Concepts Used
🔹 count

Used to create multiple EC2 instances.

🔹 for_each

Used for dynamic resource creation.

🔹 depends_on

Ensures correct resource creation order.

```bash
ssh -i terra-key ubuntu@<public-ip>
```

---

## ⚙️ Step 3: Method 1 (Using Shell Script)

Terraform automatically runs:

```bash
nginx_install.sh
```

✔ Installs Nginx during EC2 launch
✔ Basic setup completed

---

## ⚙️ Step 4: Method 2 (Using Ansible from Local Machine)

### 💡 Concept

* **Local Machine (WSL)** → Control Node
* **EC2 Instance** → Managed Node
* Connection via **SSH (terra-key)**

---

### 🔹 Architecture

```
Local Machine (WSL)
        │
        │  SSH (terra-key)
        ▼
AWS EC2 Instance (Ubuntu)
        │
        ▼
Nginx Installed & Website Deployed
```

---

### 🔹 Steps to Execute Ansible

#### 1. Navigate to Ansible directory

```bash
cd Ansible-project
```

---

#### 2. Update inventory file

```ini
[servers]
<public-ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/terra-key
```

---

#### 3. Test connection

```bash
ansible all -i inventory.ini -m ping
```

---

#### 4. Run playbook

```bash
ansible-playbook -i inventory.ini playbook.yml
```

---

### 🔹 What Ansible Does

* Installs Nginx
* Starts Nginx service
* Deploys custom `index.html`

---

### 🔹 Key Advantages

✔ No need to install Ansible on EC2
✔ Easy debugging from local system
✔ Follows real DevOps workflow

---

## 🌍 Step 5: Verify Output

Open in browser:

```
http://<public-ip>
```

✅ Custom webpage visible

---

## 🔁 Workflow Summary

1. Terraform → EC2 creation
2. Shell Script → Basic setup
3. Ansible → Configuration & deployment

---

## 🔐 Security Best Practices

Do NOT upload:

```
.terraform/
*.tfstate
*.tfstate.backup
terra-key
```

---

## 🎯 Learning Outcomes

* Terraform basics (EC2, Security Groups)
* User-data script usage
* Ansible playbooks & inventory
* SSH connectivity debugging
* DevOps workflow understanding

---

## 🚀 Future Enhancements

* Terraform + Ansible automation
* Dynamic inventory
* Multi-instance setup
* CI/CD pipeline

---

## 🙌 Conclusion

This project demonstrates:

✔ Infrastructure provisioning using Terraform
✔ Configuration management using Ansible
✔ Local-to-remote automation using SSH

---

