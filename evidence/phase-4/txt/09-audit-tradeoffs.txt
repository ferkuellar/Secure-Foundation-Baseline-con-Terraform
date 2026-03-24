# Phase 4 Audit Trade-offs

## Decision

Implement a baseline audit posture using CloudTrail, AWS Config, VPC Flow Logs, and a minimal CloudWatch detection signal.

## Why

This provides traceability for management actions, infrastructure configuration recording, and network traffic visibility without overbuilding the initial platform.

## Benefits

- baseline API auditability
- configuration change tracking
- network flow visibility
- basic administrative event detection

## Risks

- CloudTrail management events only; no data event coverage yet
- minimal alarming, not full detection engineering
- Flow Logs create operational noise if not curated later
- AWS Config all-supported recording can increase volume over time

## Future Direction

- add SNS notifications for alarms
- add Config Rules / Conformance Packs
- add GuardDuty and Security Hub
- add CloudTrail data events where justified
- move some telemetry to centralized logging account
