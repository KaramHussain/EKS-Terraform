######################### CREATING vpc ########################################
module "VPC" {
  source                     = "./modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  vpc_name                   = "$var.project-name-vpc"
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  availability_zones         = var.availability_zones
}


############################  EKS #################################################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.VPC.vpc_id
  subnet_ids = module.VPC.private_subnet_ids

  enable_irsa = true

  eks_managed_node_group_defaults = {
    disk_size = var.disk_size
  }

  eks_managed_node_groups = {
    nodes = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_type
    }
  }
}