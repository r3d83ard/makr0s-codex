# Agent Instructions

This repository uses a spec-first, lightweight workflow for Codex execution.

## Required Execution Order

1. Read the active task doc in `docs/tasks/`.
2. Read `docs/codex/COMMANDS.md` before running any verification command.
3. Implement only scoped changes from the task doc.
4. Run verification commands from `docs/codex/COMMANDS.md`.
5. Update the task doc with evidence and final outcome.
6. If an architectural tradeoff changed, add an ADR in `docs/adr/`.
7. Open a PR using `.github/PULL_REQUEST_TEMPLATE.md` and `docs/codex/CHECKLIST.md`.

## Guardrails

- Branch naming must be `codex/<task-slug>`.
- Do not duplicate command lists in multiple docs; `docs/codex/COMMANDS.md` is canonical.
- Do not mark a task complete when required checks are failing.
