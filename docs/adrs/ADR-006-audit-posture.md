# ADR-006: Audit Posture Baseline

## Status

Accepted

## Context

The platform requires a minimum audit and security posture baseline to support traceability, governance, and future operational response.

## Decision

Use:

- CloudTrail for management event logging
- CloudTrail delivery to S3 and CloudWatch Logs
- AWS Config with service-linked role and delivery channel
- VPC Flow Logs to CloudWatch Logs
- a minimal CloudWatch metric filter and alarm for sensitive IAM actions

## Consequences

### Positive

- stronger auditability
- better visibility into changes and management actions
- a usable baseline for later controls

### Negative

- additional cost for log ingestion and storage
- more IAM and logging resources to maintain
- limited detection depth at this stage
