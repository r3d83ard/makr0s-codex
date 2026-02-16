## Task Doc Link

- [ ] Linked task doc in `docs/tasks/`:

## Summary Of Changes

<what changed and why>

## Verification

### Commands Run

- `<command>`

### Output Summary

<pass/fail summary with key evidence>

## Machine Evidence (Required For `.nc` Changes)

### Operator Notes

<what was observed by operator; use N/A only for docs-only or non-executable stub changes>

### Dry-Run Checklist Reference

<task doc section showing dry-run completion or N/A>

### Supervised Run Checklist Reference

<task doc section showing supervised run completion or N/A>

### Offsets / Variables Touched

<list offsets and macro variables changed or planned>

## Risks

<known risks introduced by this change>

## Rollback Plan

<how to safely revert or disable if needed>

## Checklist (from docs/codex/CHECKLIST.md)

- [ ] Scope respected (no out-of-scope work merged)
- [ ] Program policy respected (`.nc` files are one program per file and in `O9000-O9099`)
- [ ] Unsupported M-codes (`M111`, `M112`) are not used
- [ ] Program registry updated for new/changed macro IDs
- [ ] Dry-run checklist completed or explicitly marked not applicable (docs-only or non-executable stub change)
- [ ] Supervised-run checklist completed or explicitly marked not applicable (docs-only or non-executable stub change)
- [ ] Operator notes included for macro changes
- [ ] Canonical setup/build/test/lint/format checks are clean
- [ ] Documentation updated (workflow/commands/templates/baseline docs as needed)
- [ ] Task report is complete and accurate
- [ ] ADR added when architecture/tradeoff changed
- [ ] PR summary includes risks and rollback plan
