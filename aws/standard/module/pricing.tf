module "ec2_pricing" {
  source  = "lgallard/aws-pricing/aws"
  region  = "us-east-1"
  service = "AmazonEC2"
  
  attributes = {
    instanceType    = "t3.medium"
    operatingSystem = "Linux"
    tenancy         = "Shared"
    termType        = "OnDemand"
    location        = "US East (N. Virginia)"
  }
}

module "ebs_pricing" {
  source  = "lgallard/aws-pricing/aws"
  region  = "us-east-1"
  service = "AmazonEBS"
  
  attributes = {
    volumeType = "gp3"
    location   = "US West"
    termType   = "OnDemand"
  }
}

module "nat_gateway_pricing" {
  source  = "lgallard/aws-pricing/aws"
  region  = "us-east-1"
  service = "AmazonVPC"

  attributes = {
    productFamily = "NAT Gateway"
    termType      = "OnDemand"
    location      = "US West"
  }
}

output "total_monthly_price" {
  value = module.ec2_pricing.price + module.ebs_pricing.price + module.nat_gateway_pricing.price
}
