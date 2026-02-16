# Control Baseline: Smart MINI VMC / Fanuc OI-MF Plus

## Scope

This repository targets a Smart Machine Tool MINI VMC running Fanuc OI-MF Plus.

## Required Controller Capabilities

- Custom Macro B is available.
- Skip/probe input is wired and readable by macro logic.
- Operator can execute macros in both inch (`G20`) and metric (`G21`) workflows.

## Baseline Assumptions

- Program development in this repository is constrained to O9000-series custom macros.
- Macro programs are authored and reviewed offline before machine execution.
- Safety review follows `docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md` for any `.nc` change intended for machine use.

## Out Of Scope For This Baseline

- Compatibility with non-Fanuc controls.
- Production-ready cycle constants before machine-specific calibration context is documented.
