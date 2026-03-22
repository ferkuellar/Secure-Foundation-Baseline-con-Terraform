# Phase 3 Secure Access Trade-offs

## Decision

Use AWS Systems Manager Session Manager for administrative access instead of opening SSH to the internet.

## Why

This reduces attack surface and removes the need for inbound administrative ports.

## Security Group Intent

- no inbound rules on the admin instance security group
- outbound HTTPS allowed for Systems Manager and package retrieval
- outbound DNS allowed for name resolution
- no broad inbound administrative access

## Benefits

- no SSH exposure
- simpler access control model
- less credential sprawl
- auditable management pattern

## Risks

- dependency on SSM Agent health
- dependency on outbound path to Systems Manager endpoints
- additional IAM dependency

## Future Hardening

- replace NAT dependency with VPC interface endpoints for SSM, EC2Messages, and SSMMessages
- add patching and inventory via Systems Manager
- add tighter outbound controls if required
