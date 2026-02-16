#!/usr/bin/env bash
set -euo pipefail

required_paths=(
  "README.md"
  "AGENTS.md"
  "docs/codex/WORKFLOW.md"
  "docs/codex/COMMANDS.md"
  "docs/codex/CHECKLIST.md"
  ".github/PULL_REQUEST_TEMPLATE.md"
  "docs/machine/smart-mini-vmc/CONTROL-BASELINE.md"
  "docs/machine/smart-mini-vmc/PROBE-TOOLSETTER-STACK.md"
  "docs/machine/smart-mini-vmc/PROGRAM-NUMBERING.md"
  "docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md"
  "docs/machine/smart-mini-vmc/macro-header-contract.md"
  "docs/machine/smart-mini-vmc/program-registry.csv"
  "macros/oi-mf-plus/common"
  "macros/oi-mf-plus/probe-calibration"
  "macros/oi-mf-plus/toolsetter-calibration"
  "scripts/verify/check-structure.sh"
  "scripts/verify/check-program-policy.sh"
  "scripts/verify/check-registry-sync.sh"
  "scripts/verify/check-task-evidence.sh"
)

fail=0

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "[FAIL] Missing required path: $path"
    fail=1
  fi
done

if rg -n "TODO: add .* command" docs/codex/COMMANDS.md >/dev/null 2>&1; then
  echo "[FAIL] docs/codex/COMMANDS.md still contains TODO command placeholders"
  fail=1
fi

for script in scripts/verify/check-*.sh; do
  if [[ ! -x "$script" ]]; then
    echo "[FAIL] Verification script is not executable: $script"
    fail=1
  fi
done

if (( fail != 0 )); then
  echo "[FAIL] Structure verification failed"
  exit 1
fi

echo "[PASS] Structure verification passed"
