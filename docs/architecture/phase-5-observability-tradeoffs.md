# Phase 5 Observability Trade-offs

## Decision

Implement a focused operational observability baseline instead of a broad telemetry program.

## Why

The goal is to make the environment operable with a small, meaningful signal set.

## Included

- EC2 CPU and status check alarms
- CloudWatch Agent for memory, disk, and host logs
- VPC Flow Log reject metric and alarm
- a small CloudWatch dashboard

## Benefits

- practical operator view
- faster triage
- explicit host log retention
- useful telemetry beyond default EC2 metrics

## Risks

- host log paths may need tuning by AMI or distribution
- Flow Log rejects are useful but not always incidents
- this is not a full SIEM or NOC design

## Future Direction

- composite alarms
- SNS / ChatOps notification path
- application logs and SLO-aligned dashboards
- centralized cross-account observability
