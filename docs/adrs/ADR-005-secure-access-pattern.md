# ADR-005: Secure Access Pattern

## Status

Accepted

## Context

The platform needs an administrative access pattern for EC2 instances that avoids exposing SSH to the internet.

## Decision

Use AWS Systems Manager Session Manager with:

- a private EC2 admin host
- no inbound SSH security group rules
- IAM instance profile attached to the instance
- AmazonSSMManagedInstanceCore policy
- outbound HTTPS and DNS only

## Consequences

### Positive

- reduced attack surface
- no public administrative port exposure
- stronger alignment with secure-by-default operations
- easier future auditability

### Negative

- dependency on Systems Manager prerequisites
- dependency on outbound connectivity or VPC endpoints
- additional IAM resources to manage
