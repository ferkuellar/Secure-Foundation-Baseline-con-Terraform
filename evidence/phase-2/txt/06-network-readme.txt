
# Network Module

## Purpose

Provision a secure baseline VPC layout with public and private subnets, internet egress, and deterministic routing.

## Design

- 1 VPC
- 2 public subnets
- 2 private subnets
- 1 internet gateway
- 1 NAT gateway
- 1 public route table
- 1 private route table

## Notes

- Public subnets receive public IPs on launch.
- Private subnets do not receive public IPs on launch.
- Private outbound internet access is provided through a public NAT Gateway placed in the first public subnet.
- This is a cost-aware dev baseline. Production should typically use one NAT Gateway per AZ.

## Inputs

- project_name
- environment
- aws_region
- name_prefix
- common_tags
- vpc_cidr
- public_subnet_cidrs
- private_subnet_cidrs

## Outputs

- vpc_id
- vpc_cidr
- internet_gateway_id
- nat_gateway_id
- public_subnet_ids
- private_subnet_ids
- public_route_table_id
- private_route_table_id
- availability_zones_used
