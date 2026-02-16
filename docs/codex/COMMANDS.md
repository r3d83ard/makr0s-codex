# Canonical Commands

This file is the single source of truth for local setup/build/test/lint/format verification.
If the workflow changes, update this file first.

| Purpose | Command | When to run | Expected signal |
| --- | --- | --- | --- |
| Setup environment | `bash scripts/verify/check-structure.sh` | On first clone and before PR | Required directories/docs/scripts exist and command catalog has no TODO placeholders |
| Build | `bash scripts/verify/check-program-policy.sh` | After editing `.nc` macro files and before PR | Macro header and O90xx policy pass, unsupported M-codes are absent |
| Test | `bash scripts/verify/check-registry-sync.sh` | Before marking task complete | Program registry and macro file IDs are synchronized |
| Lint | `bash scripts/verify/check-task-evidence.sh` | Before PR | Macro source changes include task doc references for operator notes and safety checklists |
| Format check | `git diff --check` | Before PR | No whitespace formatting violations in working tree |
