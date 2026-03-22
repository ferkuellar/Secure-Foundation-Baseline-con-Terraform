# Access Module

## Purpose

Provide secure administrative access to a private EC2 instance using AWS Systems Manager Session Manager without exposing SSH.

## Design

- private EC2 admin host
- no inbound SSH
- outbound HTTPS and DNS only
- IAM role attached through instance profile
- AmazonSSMManagedInstanceCore policy attached
- IMDSv2 enforced
- encrypted root volume

## Notes

This baseline assumes the private subnet already has outbound connectivity through NAT Gateway or VPC endpoints for Systems Manager.

## Outputs

- admin_security_group_id
- admin_instance_id
- admin_instance_private_ip
- ssm_role_name
- ssm_instance_profile_name
- admin_ami_id
