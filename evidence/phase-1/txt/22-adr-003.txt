# ADR-003: Tagging Standard

## Status

Accepted

## Context

FinOps, operations, and governance all depend on consistent metadata.

## Decision

A mandatory common tag set will be defined in each environment root and inherited by modules through provider default tags and explicit merge patterns.

## Consequences

### Positive

- consistent cost attribution
- better operations traceability
- stronger governance posture

### Negative

- stricter input requirements
- possible friction if unmanaged legacy resources are introduced
