# Probe And Tool Setter Stack

## Hardware

- Probe: 3D Touch GP-800
- Tool setter: 3D Touch WP-600

## Integration Notes

- Macro behavior must match the GP-800/WP-600 signal and M-code behavior available on this machine.
- The stack does not support Renishaw-specific M-codes `M111` and `M112`.
- Any command pattern ported from Renishaw examples must be rewritten for this hardware.

## Validation Expectations

- Every macro change must document assumptions about probe/toolsetter signal behavior.
- Machine-side validation is recorded in task docs using operator notes plus dry-run/supervised-run checklist references.
