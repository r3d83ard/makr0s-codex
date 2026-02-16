# Codex Workflow

Default method: spec-first -> focused implementation -> explicit verification -> machine safety evidence -> structured task report -> PR checklist.

## Canonical 9-Step Loop

1. Create a task report from `docs/codex/TEMPLATES/task-template.md` in `docs/tasks/`.
2. Define scope and acceptance criteria in that task report.
3. For macro tasks, confirm machine baseline and controller assumptions from `docs/machine/smart-mini-vmc/`.
4. Implement in small commits on `codex/<task-slug>`.
5. For `.nc` changes, perform dry-run and supervised first-run workflow from `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md`.
6. Run verification commands from `docs/codex/COMMANDS.md`.
7. Record command evidence and machine evidence in the task report.
8. If an architectural tradeoff changed, add an ADR from `docs/codex/TEMPLATES/adr-template.md` in `docs/adr/`.
9. Open a pull request using `.github/PULL_REQUEST_TEMPLATE.md` and `docs/codex/CHECKLIST.md`.

## Failure Policy

- If required checks fail, do not mark the task `done`.
- If macro changes do not include operator notes plus dry-run and supervised-run evidence, do not mark the task `done`.

## Documentation Interfaces

### Task Report Front Matter (Required Keys)

- `id` (example: `task-2026-02-16-<slug>`)
- `title`
- `status` (`planned|in_progress|blocked|done`)
- `owner`
- `branch`
- `created`
- `updated`

### Task Report Sections For Macro Changes

- `## Operator Notes`
- `## Dry-Run Checklist`
- `## Supervised Run Checklist`
- Reference `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md`

### ADR Front Matter (Required Keys)

- `id` (example: `adr-0001`)
- `title`
- `status` (`proposed|accepted|superseded`)
- `date`
- `supersedes` (optional)

### Naming Conventions

- Task files: `docs/tasks/YYYY-MM-DD-<slug>.md`
- ADR files: `docs/adr/NNNN-<slug>.md`
- Macro files: `macros/oi-mf-plus/<module>/O####-<slug>.nc`
