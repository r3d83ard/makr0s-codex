---
id: task-2026-02-16-probe-toolsetter-calibration-kickoff
title: "Kickoff: Probe and Tool Setter Calibration Macro Bundle"
status: planned
owner: codex
branch: codex/probe-toolsetter-calibration-kickoff
created: 2026-02-16
updated: 2026-02-16
---

## Goal

Implement calibration macro logic for GP-800 probe and WP-600 tool setter on Fanuc OI-MF Plus.

## Scope

### In Scope

- Implement O9020 probe calibration logic.
- Implement O9050 tool setter calibration logic.
- Capture machine-run evidence per safety runbook.

### Out of Scope

- Production probing cycles beyond calibration.
- Additional controller support.

## Acceptance Criteria

- Calibration macros execute as intended under supervised machine validation.
- Operator notes and checklist evidence are captured in the task report.
- Registry entries are updated with validation task/date.

## Implementation Notes

- Reserved program IDs are already registered in `docs/machine/smart-mini-vmc/program-registry.csv`.
- Macro stubs exist in `macros/oi-mf-plus/probe-calibration/` and `macros/oi-mf-plus/toolsetter-calibration/`.

## Operator Notes

- Pending implementation.

## Dry-Run Checklist

- Reference: `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md`
- [ ] Dry-run completed
- [ ] Stop/recovery flow validated

## Supervised Run Checklist

- Reference: `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md`
- [ ] First supervised run completed
- [ ] Result and offsets reviewed

## Verification Evidence

| Command | Result |
| --- | --- |
| `pending` | `pending` |

## Risks And Follow-Ups

- Requires machine constants and calibration procedure details from operator context.

## Final Outcome

Not started.
