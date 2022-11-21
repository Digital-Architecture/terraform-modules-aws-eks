# NTTDATA - DIGITAL ARCHITECTURE
# Create: Marcos Cianci
# Date: Qua 21 Set 2022

data "terraform_remote_state" "networking" {
  backend = "s3"
  workspace = "${terraform.workspace}"
  
  config = {
    bucket    = "terraform-labs-digital-architecture"
    key       = "terraform/lab-eks-infra.tfstate"
    region    = "us-west-1"
  }
}

data "aws_vpc" "vpc-lab-eks" {
    tags = {
      Name = "vpc-lab-eks"
    }
}


data "aws_subnet_ids" "private_subnet_ids" {
  vpc_id = var.vpc_id

  filter {
    name    = "tag:kubernetes.io/cluster/${var.name}"
    values  = ["shared"]
  }

  filter {
    name    = "tag:kubernetes.io/role/internal-elb"
    values  = [1]
  }
}

data "aws_subnet_ids" "public_subnet_ids" {
  vpc_id = var.vpc_id

  filter {
    name    = "tag:kubernetes.io/cluster/${var.name}"
    values  = ["shared"]
  }

  filter {
    name    = "tag:kubernetes.io/role/elb"
    values  = [1]
  }
}


data "aws_subnet" "private_subnets" {
  for_each = data.aws_subnet_ids.private_subnet_ids.ids
  id       = each.value
}


data "aws_subnet" "public_subnets" {
  for_each = data.aws_subnet_ids.public_subnet_ids.ids
  id       = each.value
}
