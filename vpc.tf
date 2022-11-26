module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc.name
  cidr = local.vpc.cidr

  azs             = local.general_vpc.azs
  private_subnets = local.vpc.subnets.private
  public_subnets  = local.vpc.subnets.public

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
