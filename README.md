# 🚀 Terraform AWS Modular Infrastructure

This Terraform project builds a modular and reusable infrastructure on AWS, using best practices for scalability, clarity, and maintainability. It includes modules for creating a VPC, Security Groups, and EC2 instances — all configurable using variables and outputs.

---

## 📦 Project Structure

```
module_ec2_creation/
├── main.tf                # Root configuration that invokes the modules
├── variables.tf           # Global variables passed into modules
├── outputs.tf             # Outputs from root modules
├── modules/
│   ├── vpc/               # Module for VPC, Subnet, Route Table, IGW
│   ├── security_group/    # Module for Security Group
│   └── ec2/               # Module for EC2 Instance creation
```

---

## 🏗️ Infrastructure Components

### 1. **VPC Module**

Creates a new Virtual Private Cloud and associated resources:

* VPC with custom CIDR block
* Public Subnet in a specified Availability Zone
* Internet Gateway
* Route Table and Route Table Association

### 2. **Security Group Module**

Creates a Security Group with inbound/outbound rules:

* Allows HTTP (80), HTTPS (443), and SSH (22) access
* Configurable via module input

### 3. **EC2 Module**

Launches an EC2 instance with:

* AMI ID and instance type as input
* Key pair for SSH access
* Associated subnet and security group
* User data script for provisioning (optional)
* Outputs for instance ID and public IP

---

## ⚙️ Input Variables (From `terraform.tfvars`)

You can configure the infrastructure by editing the `terraform.tfvars` file:

```hcl
vpc_cidr          = "192.168.0.0/16"
subnet_cidr       = "192.168.0.0/24"
availability_zone = "ap-south-1a"
default_ip        = "0.0.0.0/0"
ami_id            = "ami-0123456789abcdef0"
instance_type     = "t2.micro"
key_name          = "my-keypair"
```

---

## 📤 Outputs

After deployment, the following outputs are available:

```hcl
vpc_id             = <VPC-ID>
subnet_id          = <Subnet-ID>
security_group_id  = <SG-ID>
instance_id        = <EC2-ID>
public_ip          = <Public IP>
```

---

## 🚀 How to Deploy

```bash
# Step 1: Initialize the working directory
terraform init

# Step 2: Validate the configuration
terraform validate

# Step 3: Plan the deployment
terraform plan

# Step 4: Apply the changes
terraform apply -auto-approve
```

---

## 🧱 Terraform Version

Tested with:

```hcl
Terraform v1.6.0+
AWS Provider v5.0+
```

---

## 🛡️ Best Practices Followed

* Modular structure (reusable and clean code)
* DRY principle via shared variables and tags
* Secure key-pair-based SSH access
* Output values for integration with other systems
* Validated via `terraform validate`

---

## 📌 Future Enhancements (Optional)

* Add Auto Scaling and Load Balancer module
* Use S3 remote backend for `.tfstate`
* Implement CI/CD using GitHub Actions
* Use Terraform Cloud or CloudFormation StackSets
* Create `locals.tf` for default values

---