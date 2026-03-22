# Phase 2 Network Trade-offs

## Decision

Use a single NAT Gateway for the dev baseline.

## Why

This keeps the environment cost-aware while still implementing a realistic public/private subnet pattern.

## Benefits

- lower cost
- simpler routing model
- faster learning path
- enough for baseline validation

## Risks

- outbound dependency on a single NAT Gateway
- reduced resilience versus one NAT per AZ
- not ideal for production-grade egress architecture

## Future Direction

For production, move to:

- one NAT Gateway per AZ
- private route table per AZ
- stronger fault isolation
