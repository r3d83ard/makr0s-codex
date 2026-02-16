# Definition Of Done Checklist

Use this checklist for every PR.

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
