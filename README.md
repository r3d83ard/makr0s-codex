# makr0s-codex

Repository for developing probing and tool-setting Custom Macro B programs for a Smart Machine Tool MINI VMC running a Fanuc OI-MF Plus controller.

## Controller And Hardware Scope

- Machine: Smart Machine Tool MINI VMC
- Controller: Fanuc OI-MF Plus
- Probe: 3D Touch GP-800
- Tool setter: 3D Touch WP-600
- Compatibility note: Renishaw-specific M-codes `M111` and `M112` are unsupported in this stack.

## How We Work With Codex

- Workflow: `docs/codex/WORKFLOW.md`
- Canonical commands: `docs/codex/COMMANDS.md`
- Definition of done: `docs/codex/CHECKLIST.md`
- Machine baseline: `docs/machine/smart-mini-vmc/CONTROL-BASELINE.md`

## Repository Layout

- `macros/oi-mf-plus/`: one-program-per-file `.nc` macro library
- `docs/machine/smart-mini-vmc/`: machine baseline, numbering policy, safety runbook, and program registry
- `scripts/verify/`: local verification scripts referenced by `docs/codex/COMMANDS.md`
- `docs/tasks/`: task reports with implementation and verification evidence
- `docs/adr/`: architecture and tradeoff records

## Quickstart

1. Create a branch: `git checkout -b codex/<task-slug>`.
2. Create a task report:
   `cp docs/codex/TEMPLATES/task-template.md docs/tasks/$(date +%F)-<task-slug>.md`.
3. Define scope and acceptance criteria in the task report.
4. Implement scoped changes only.
5. Run all commands listed in `docs/codex/COMMANDS.md`.
6. Record command results plus operator notes and safety checklist references in the task report.
7. Open a pull request using `.github/PULL_REQUEST_TEMPLATE.md`.
