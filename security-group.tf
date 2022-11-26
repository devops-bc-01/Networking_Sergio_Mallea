module "security-group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ec2_security_group"
  description = "Security group for ec2"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  ingress_rules       = ["all-icmp", "ssh-tcp"]
  egress_rules        = ["all-icmp", "ssh-tcp"]
}

module "vpc-security-group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "vpc-security-group-smm"
  description = "security group for vpc"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-icmp", "ssh-tcp"]
}