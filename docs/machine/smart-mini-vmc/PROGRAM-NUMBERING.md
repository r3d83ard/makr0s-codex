# Program Numbering Policy

All custom macros in this repository must remain within `O9000-O9099`.

## Range Allocation

- `O9000-O9019`: Shared safety and common utility programs
- `O9020-O9049`: Probe calibration programs
- `O9050-O9079`: Tool setter calibration programs
- `O9080-O9099`: Reserved for future expansion

## File Naming

Use one program per file in this pattern:

- `macros/oi-mf-plus/<module>/O####-<slug>.nc`

Examples:

- `macros/oi-mf-plus/probe-calibration/O9020-probe-calibration-stub.nc`
- `macros/oi-mf-plus/toolsetter-calibration/O9050-toolsetter-calibration-stub.nc`

## Rules

- The `(Program: O####)` header must match the O-number used in the file body.
- Program IDs must be registered in `docs/machine/smart-mini-vmc/program-registry.csv`.
- Duplicate program IDs are not allowed.
