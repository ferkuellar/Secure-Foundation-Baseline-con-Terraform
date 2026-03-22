# ADR-004: Network Baseline

## Status

Accepted

## Context

The project requires a reusable network baseline to support secure access, observability, and future workload placement.

## Decision

The baseline will use:

- one VPC
- two public subnets
- two private subnets
- one Internet Gateway
- one public NAT Gateway
- one public route table
- one private route table

The NAT Gateway will be placed in the first public subnet for the dev environment.

## Consequences

### Positive

- realistic network segmentation
- clear public versus private routing behavior
- reusable output contract for later phases

### Negative

- single NAT Gateway creates an egress dependency
- not equivalent to a production multi-AZ egress design
- future production hardening will require per-AZ routing expansion
