# Safety Runbook

Use this runbook before promoting any `.nc` macro change to machine use.

## 1) Pre-Run Safety Checks

- Confirm machine is Smart MINI VMC with Fanuc OI-MF Plus baseline.
- Confirm probe/toolsetter hardware matches GP-800 and WP-600 assumptions.
- Confirm current offsets and relevant macro variables are backed up.
- Confirm emergency stop and feed hold are reachable and tested.

## 2) Dry-Run Procedure

- Run macro in controlled conditions with no part-risking motion.
- Verify branch points, alarms, and abort paths behave as expected.
- Record observations and anomalies in the active task doc under `## Operator Notes`.

## 3) Supervised First-Run Procedure

- Execute first machine run under direct supervision.
- Monitor intended offsets/variables and confirm expected changes.
- If behavior is unexpected, abort and rollback immediately.

## 4) Required Documentation Evidence

For macro changes, the task doc must include:

- `## Operator Notes`
- `## Dry-Run Checklist`
- `## Supervised Run Checklist`

Use `N/A` only when the change is docs-only or when `.nc` changes are explicitly non-executable stubs with no motion logic.
