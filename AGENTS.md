# Agent Instructions

This repository uses a spec-first, lightweight workflow for Fanuc OI-MF Plus macro development.

## Required Execution Order

1. Read the active task doc in `docs/tasks/`.
2. Read `docs/codex/COMMANDS.md` before running any verification command.
3. Read machine baseline docs in `docs/machine/smart-mini-vmc/` before changing `.nc` macro files.
4. Implement only scoped changes from the task doc.
5. Run verification commands from `docs/codex/COMMANDS.md`.
6. If `.nc` macro files changed, include operator notes plus dry-run and supervised-run checklist evidence in the task doc.
7. Update the task doc with evidence and final outcome.
8. If an architectural tradeoff changed, add an ADR in `docs/adr/`.
9. Open a PR using `.github/PULL_REQUEST_TEMPLATE.md` and `docs/codex/CHECKLIST.md`.

## Guardrails

- Branch naming must be `codex/<task-slug>`.
- Macro sources must be one program per `.nc` file.
- Program IDs must follow the `O9000-O9099` policy in `docs/machine/smart-mini-vmc/PROGRAM-NUMBERING.md`.
- Do not use unsupported M-codes `M111` and `M112` for the GP-800/WP-600 stack.
- Do not duplicate command lists in multiple docs; `docs/codex/COMMANDS.md` is canonical.
- Do not mark a task complete when required checks are failing.
