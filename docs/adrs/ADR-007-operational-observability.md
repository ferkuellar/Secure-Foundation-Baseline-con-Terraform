# ADR-007: Operational Observability Baseline

## Status

Accepted

## Context

The platform needs an operational observability layer that is useful during day-to-day troubleshooting and not limited to passive log retention.

## Decision

Use:

- native EC2 metrics for CPU and status checks
- CloudWatch Agent for memory, disk, and host log collection
- explicit CloudWatch log groups with retention
- VPC Flow Log reject signal via metric filter
- a compact CloudWatch dashboard

## Consequences

### Positive

- stronger operational visibility
- clearer triage path
- meaningful alarms instead of telemetry sprawl

### Negative

- extra agent dependency on the host
- more CloudWatch resources to manage
- some Linux log file paths may require future tuning
