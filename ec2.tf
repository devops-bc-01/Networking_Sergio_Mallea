module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  count   = length(local.vpc.subnets.private)

  depends_on = [
    module.vpc, module.security-group
  ]

  name = "ec2-office-${count.index}"

  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = tolist([module.security-group.security_group_id])
  subnet_id              = module.vpc.private_subnets[count.index]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  count   = length(local.vpc.subnets.public)
  depends_on = [
    module.vpc, module.security-group
  ]

  name = "ec2-remote-office-${count.index}"

  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = tolist([module.security-group.security_group_id])
  subnet_id              = module.vpc.public_subnets[count.index]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
