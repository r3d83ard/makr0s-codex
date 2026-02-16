# Macro Header Contract

Each `.nc` macro file must include these header keys, one per line:

- `Program`
- `Purpose`
- `Machine`
- `Controller`
- `Hardware`
- `Units`
- `Inputs`
- `Outputs`
- `Safety`
- `Revision`

## Required Format

Use parenthesized comment lines:

```text
(Program: O9020)
(Purpose: GP-800 probe calibration bootstrap stub)
(Machine: Smart Machine Tool MINI VMC)
(Controller: Fanuc OI-MF Plus)
(Hardware: 3D Touch GP-800)
(Units: Dual (G20/G21))
(Inputs: Macro B variables and skip input)
(Outputs: Calibration offsets and status flags)
(Safety: Dry-run and supervised run required before production use)
(Revision: 0.1.0)
```

## Additional Rules

- `Program` must be in `O9000-O9099`.
- Do not use unsupported M-codes `M111` or `M112`.
- Header `Program` must match the registered ID in `program-registry.csv`.
