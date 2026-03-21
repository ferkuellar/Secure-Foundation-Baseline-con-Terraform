# ADR-002: Naming Standard

## Status

Accepted

## Context

Without a deterministic naming pattern, resources become inconsistent, harder to audit, and more difficult to correlate operationally.

## Decision

Resource names will follow a project-environment-centered pattern using lowercase and hyphen separators.

## Consequences

### Positive

- easier searchability
- predictable resource inventory
- cleaner documentation alignment

### Negative

- longer names in some resources
- possible provider-specific shortening needed
