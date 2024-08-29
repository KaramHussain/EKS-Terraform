# Terraform EKS and VPC Setup

## Overview

This Terraform codebase provisions an Amazon Web Services (AWS) Elastic Kubernetes Service (EKS) cluster along with a custom Virtual Private Cloud (VPC) network. The setup includes the creation of a VPC, public and private subnets, an internet gateway, a NAT gateway, and an EKS cluster with managed node groups. The infrastructure is designed to be production-ready with scalability and high availability in mind.

### Key Components
1. **VPC (Virtual Private Cloud):** A custom VPC with both public and private subnets.
2. **Subnets:** Public subnets for external traffic and private subnets for internal resources.
3. **Internet Gateway:** Facilitates internet access for resources within the public subnet.
4. **NAT Gateway:** Allows instances in private subnets to access the internet securely.
5. **Route Tables:** Routes traffic within the VPC and to the internet.
6. **Elastic Kubernetes Service (EKS):** Fully managed Kubernetes service with managed node groups.

## Prerequisites

### Tools
- [Terraform](https://www.terraform.io/downloads.html) - Version `>= 1.0`
- AWS CLI configured with appropriate credentials
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - Version `>= 1.14.0`
- [helm](https://helm.sh/docs/intro/install/) - Version `>= 2.6.0`

### AWS Setup
Ensure that your AWS account has sufficient permissions to create resources, including but not limited to:
- VPC
- Subnets
- Internet Gateways
- NAT Gateways
- EKS Clusters
- IAM Roles
- EC2 Instances

### Variables
The configuration uses various input variables, making it flexible to adapt to different environments. Key variables include:
- `vpc_cidr_block`: CIDR block for the VPC.
- `availability_zones`: Availability Zones for subnets.
- `cluster_name`: The name of the EKS cluster.
- `instance_type`: EC2 instance types for the EKS node group.
- `max_size`, `min_size`, `desired_size`: Configurations for autoscaling the EKS node group.

## Directory Structure

```plaintext
├── main.tf              # Main Terraform configuration file.
├── modules
│   └── vpc              # Custom module to create VPC and associated resources.
│       ├── main.tf      # Terraform configuration for VPC.
│       ├── outputs.tf   # Outputs from VPC module.
│       └── variables.tf # Input variables for VPC module.
├── outputs.tf           # Outputs from the root module.
├── providers.tf         # Configuration for providers (AWS, Helm, Kubectl).
└── variables.tf         # Input variables for the root module.
