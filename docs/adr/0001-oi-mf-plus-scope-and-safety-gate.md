---
id: adr-0001
title: "Constrain macro workflow to OI-MF Plus and enforce machine safety evidence"
status: accepted
date: 2026-02-16
supersedes:
---

## Context

The repository started as a generic Codex markdown operating system with no machine-specific requirements. This project now targets custom macro development for a Smart MINI VMC with a Fanuc OI-MF Plus controller and a specific probe/toolsetter stack.

## Decision

- Scope workflow, templates, and verification to Fanuc OI-MF Plus for this phase.
- Enforce one-program-per-file `.nc` macro sources in the O9000-O9099 range.
- Require operator notes plus dry-run and supervised-run checklist references for macro changes.
- Disallow unsupported Renishaw-specific M-codes `M111` and `M112`.

## Consequences

- Improves safety and review consistency for machine-facing changes.
- Reduces ambiguity by encoding controller/hardware assumptions in-repo.
- Defers multi-controller support until a later ADR introduces abstraction.

## Alternatives Considered

- Keep workflow controller-agnostic: rejected because it leaves unsafe ambiguity for machine execution.
- Require offline-only verification: rejected because this project prioritizes machine-first manual validation.
