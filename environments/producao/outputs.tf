output "vpc_id" {
  value = module.foundation.vpc_id
}

output "public_subnets" {
  value = module.foundation.public_subnets_ids
}
