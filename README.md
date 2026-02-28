# CST8918 Lab A05 — Terraform Web Server (Azure)

Deploy a simple **Ubuntu Linux VM** on **Azure** using **Terraform**, with:
- **Public SSH (22)** access
- **Public HTTP (80)** access
- **Apache2** installed automatically via **cloud-init**

---

## Architecture

See: `a05-architecture.png`

High-level components:
- Resource Group
- Virtual Network (10.0.0.0/16)
- Subnet (10.0.1.0/24)
- Network Security Group (Allow SSH + HTTP)
- Public IP (Static)
- Network Interface (NIC)
- Linux VM (Ubuntu 22.04 LTS, Standard_B1s)
- cloud-init script (`init.sh`) installs Apache2

---

## Prerequisites

Install locally:
- Git
- Azure CLI
- Terraform CLI
- SSH key pair (public key file must exist, e.g. `~/.ssh/id_rsa.pub` or `~/.ssh/id_ed25519.pub`)

Login to Azure:
```bash
az login
az account show
```

### Project Files

- main.tf —> Terraform resources

- variables.tf —> input variables

- outputs.tf —> deployment outputs (RG name + public IP)

- init.sh —> installs Apache2

- a05-architecture.png —> architecture diagram (required)

- a05-demo.png — browser + SSH verification screenshot (required)

### Variables

Required at deploy time:

- labelPrefix — your college username (prefix for resource names)

Defaults:

- region — set to your allowed region (ex: southafricanorth)

- admin_username — azureadmin

- ssh_public_key_path — ~/.ssh/id_rsa.pub (change if needed)

### Run / Deploy

Initialize Terraform:

```
terraform init
```

Validate:
```
terraform fmt
terraform validate
```
Deploy:
```
terraform apply
```
When prompted:

- Enter your labelPrefix (college username)

### Verify

After terraform apply, Terraform prints outputs including the public IP.

1. Open in browser:

```
http://<public_ip_address>
```

2. You should see the Apache2 Default Page.

SSH to the VM:

```
ssh azureadmin@<public_ip_address>
```

3. Confirm Apache on the VM:

```
curl -I http://localhost
```
Expected: HTTP/1.1 200 OK

### Outputs

Terraform outputs:

resource_group_name

public_ip_address

Cleanup

Destroy all Azure resources created by Terraform:
```
terraform destroy
```