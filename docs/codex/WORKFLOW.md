# Codex Workflow

Default method: spec-first -> focused implementation -> explicit verification -> structured task report -> PR checklist.

## Canonical 7-Step Loop

1. Create a task report from `docs/codex/TEMPLATES/task-template.md` in `docs/tasks/`.
2. Define scope and acceptance criteria in that task report.
3. Implement in small commits on `codex/<task-slug>`.
4. Run verification commands from `docs/codex/COMMANDS.md`.
5. Record verification evidence and outcomes in the task report.
6. If an architectural tradeoff changed, add an ADR from `docs/codex/TEMPLATES/adr-template.md` in `docs/adr/`.
7. Open a pull request using `.github/PULL_REQUEST_TEMPLATE.md` and `docs/codex/CHECKLIST.md`.

## Failure Policy

If required checks fail, do not mark the task `done`.

## Documentation Interfaces

### Task Report Front Matter (Required Keys)

- `id` (example: `task-2026-02-16-<slug>`)
- `title`
- `status` (`planned|in_progress|blocked|done`)
- `owner`
- `branch`
- `created`
- `updated`

### ADR Front Matter (Required Keys)

- `id` (example: `adr-0001`)
- `title`
- `status` (`proposed|accepted|superseded`)
- `date`
- `supersedes` (optional)

### Naming Conventions

- Task files: `docs/tasks/YYYY-MM-DD-<slug>.md`
- ADR files: `docs/adr/NNNN-<slug>.md`
