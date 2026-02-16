#!/usr/bin/env bash
set -euo pipefail

changed_files=$( {
  git diff --name-only
  git diff --name-only --cached
  git ls-files --others --exclude-standard
} | sort -u )

macro_changed=0
while IFS= read -r path; do
  if [[ "$path" == macros/* && "$path" == *.nc ]]; then
    macro_changed=1
    break
  fi
done <<< "$changed_files"

if (( macro_changed == 0 )); then
  echo "[PASS] No .nc macro changes detected; machine evidence gate skipped"
  exit 0
fi

task_candidates=""
while IFS= read -r path; do
  if [[ "$path" == docs/tasks/*.md ]]; then
    task_candidates+="$path"
    task_candidates+=$'\n'
  fi
done <<< "$changed_files"

if [[ -z "${task_candidates//[[:space:]]/}" ]]; then
  latest_task=$(ls -1t docs/tasks/*.md 2>/dev/null | head -n 1 || true)
  if [[ -n "$latest_task" ]]; then
    task_candidates="$latest_task"
  fi
fi

if [[ -z "${task_candidates//[[:space:]]/}" ]]; then
  echo "[FAIL] Macro source changes detected, but no task doc was found"
  exit 1
fi

selected_task=""
while IFS= read -r task; do
  [[ -z "$task" ]] && continue
  if [[ ! -f "$task" ]]; then
    continue
  fi

  has_operator_notes=0
  has_dry_run=0
  has_supervised=0
  has_runbook_ref=0

  if grep -Eq '^## Operator Notes' "$task"; then
    has_operator_notes=1
  fi

  if grep -Eq '^## Dry-Run Checklist' "$task"; then
    has_dry_run=1
  fi

  if grep -Eq '^## Supervised Run Checklist' "$task"; then
    has_supervised=1
  fi

  if grep -q 'docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md' "$task"; then
    has_runbook_ref=1
  fi

  if (( has_operator_notes == 1 && has_dry_run == 1 && has_supervised == 1 && has_runbook_ref == 1 )); then
    selected_task="$task"
    break
  fi
done <<< "$task_candidates"

if [[ -z "$selected_task" ]]; then
  echo "[FAIL] Macro source changes require task doc sections:"
  echo "       - ## Operator Notes"
  echo "       - ## Dry-Run Checklist"
  echo "       - ## Supervised Run Checklist"
  echo "       - Reference to docs/machine/smart-mini-vmc/SAFETY-RUNBOOK.md"
  exit 1
fi

echo "[PASS] Task evidence gate passed using $selected_task"
