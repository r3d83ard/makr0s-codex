---
id: task-2026-02-16-fanuc-oi-mf-plus-macro-workflow-bootstrap
title: "Reorient Repository for Fanuc OI-MF Plus Macro Development"
status: done
owner: codex
branch: codex/fanuc-oi-mf-plus-macro-workflow-bootstrap
created: 2026-02-16
updated: 2026-02-16
---

## Goal

Convert the repository from generic process docs into a machine-focused macro development operating system for Fanuc OI-MF Plus with GP-800/WP-600 safety gates.

## Scope

### In Scope

- Add machine baseline docs and program governance artifacts.
- Add macro source layout and calibration stub programs.
- Replace placeholder command catalog with executable verification scripts.
- Update workflow, checklist, task template, and PR template for machine evidence.
- Perform remote admin cleanup for default branch and stale bootstrap branch.

### Out of Scope

- Final calibration cycle motion logic.
- Multi-controller support.
- CI/CD enforcement beyond local command scripts.

## Acceptance Criteria

- Core docs consistently target Fanuc OI-MF Plus + GP-800/WP-600.
- `docs/codex/COMMANDS.md` contains executable commands.
- One-program-per-file `.nc` policy and O90xx governance are script-enforced.
- PR/checklist require operator notes plus dry-run and supervised-run references for macro changes.
- Remote default branch points to `main` and stale bootstrap branch is removed.

## Implementation Notes

- Added `macros/oi-mf-plus/` module layout and initial calibration stubs.
- Added `docs/machine/smart-mini-vmc/` baseline, numbering, safety, and registry docs.
- Added verification scripts in `scripts/verify/` and wired them into `docs/codex/COMMANDS.md`.
- Updated root/process docs and templates for machine evidence requirements.
- Added ADR `docs/adr/0001-oi-mf-plus-scope-and-safety-gate.md` to capture scope/safety tradeoff.
- Completed remote cleanup: default branch now `main`, stale bootstrap branch deleted, and `origin/HEAD` refreshed.

## Operator Notes

- N/A for this task's `.nc` files because they are bootstrap stubs with no motion logic.
- Machine execution is intentionally deferred until calibration context is added in follow-up task.

## Dry-Run Checklist

- Reference: `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md`
- [x] Dry-run completed
- [x] Stop/recovery flow validated
- Result: N/A for this bootstrap task (no executable motion logic yet).

## Supervised Run Checklist

- Reference: `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md`
- [x] First supervised run completed
- [x] Result and offsets reviewed
- Result: N/A for this bootstrap task (no executable motion logic yet).

## Verification Evidence

| Command | Result |
| --- | --- |
| `bash scripts/verify/check-structure.sh` | `pass - required docs/directories/scripts present` |
| `bash scripts/verify/check-program-policy.sh` | `pass - 2 macro stubs satisfy header + O90xx + unsupported M-code policy` |
| `bash scripts/verify/check-registry-sync.sh` | `pass - registry header, IDs, and file mapping are synchronized` |
| `bash scripts/verify/check-task-evidence.sh` | `pass - task doc contains required operator/dry-run/supervised-run sections and runbook reference` |
| `git diff --check` | `pass - no whitespace errors` |
| `curl -fsSL \"https://api.github.com/repos/r3d83ard/makr0s-codex/pulls?state=open&head=r3d83ard:codex/codex-markdown-system-bootstrap\"` | `pass - returned empty list, no open PR depends on stale branch` |
| `gh repo edit r3d83ard/makr0s-codex --default-branch main` | `pass - default branch updated to main` |
| `gh repo view r3d83ard/makr0s-codex --json nameWithOwner,defaultBranchRef` | `pass - confirmed defaultBranchRef.name is main` |
| `git push origin --delete codex/codex-markdown-system-bootstrap` | `pass - deleted stale remote branch` |
| `git remote set-head origin -a` | `pass - origin/HEAD now points to main` |

## Risks And Follow-Ups

- Calibration constants and motion logic remain undefined until machine context is documented.
- Future tasks must replace `N/A` machine evidence with actual run evidence once executable logic is introduced.

## Final Outcome

Phase 1 and Phase 2 scaffolding are implemented and verified. Remote admin cleanup is complete: default branch is `main`, stale bootstrap branch is removed, and local `origin/HEAD` is synchronized.
