# makr0s-codex

Repository for an agent-first, lightweight documentation system for Codex-driven delivery.

## How We Work With Codex

- Workflow: `docs/codex/WORKFLOW.md`
- Canonical commands: `docs/codex/COMMANDS.md`
- Definition of done: `docs/codex/CHECKLIST.md`

## Quickstart

1. Create a branch: `git checkout -b codex/<task-slug>`.
2. Create a task doc from the template:
   `cp docs/codex/TEMPLATES/task-template.md docs/tasks/$(date +%F)-<task-slug>.md`.
3. Fill scope and acceptance criteria in the new task doc.
4. Run verification commands listed in `docs/codex/COMMANDS.md`.
5. Open a pull request using `.github/PULL_REQUEST_TEMPLATE.md` and complete the checklist.
