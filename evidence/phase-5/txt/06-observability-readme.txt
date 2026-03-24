# Observability Module

## Purpose

Provide a minimum viable operational observability baseline for the environment.

## Components

- CloudWatch host log groups with explicit retention
- CloudWatch Agent configuration in Parameter Store
- SSM-based installation and startup of CloudWatch Agent
- EC2 alarms for CPU and status checks
- CWAgent alarms for memory and root disk usage
- Flow Log reject metric and alarm
- CloudWatch dashboard for operational review

## Notes

- Native EC2 metrics cover CPU and status checks.
- Memory and disk utilization require CloudWatch Agent.
- Metric filters transform matching log events into CloudWatch metrics.
- The dashboard is intentionally small and operational, not decorative.
