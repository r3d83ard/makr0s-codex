#!/usr/bin/env bash
set -euo pipefail

shopt -s globstar nullglob

registry="docs/machine/smart-mini-vmc/program-registry.csv"
expected_header="program_id,module,purpose,status,owner,last_validated_task,last_validated_date"

if [[ ! -f "$registry" ]]; then
  echo "[FAIL] Missing registry file: $registry"
  exit 1
fi

header=$(head -n 1 "$registry")
if [[ "$header" != "$expected_header" ]]; then
  echo "[FAIL] Registry header mismatch"
  echo "[INFO] Expected: $expected_header"
  echo "[INFO] Found:    $header"
  exit 1
fi

files=(macros/oi-mf-plus/**/*.nc)
macro_ids=()
fail=0

contains_id() {
  local needle="$1"
  shift
  local item
  for item in "$@"; do
    if [[ "$item" == "$needle" ]]; then
      return 0
    fi
  done
  return 1
}

for file in "${files[@]}"; do
  program_line=$(grep -E "^\\(Program:[[:space:]]*O[0-9]{4}[[:space:]]*\\)$" "$file" || true)
  if [[ -z "$program_line" ]]; then
    echo "[FAIL] $file has no valid Program header for registry sync"
    fail=1
    continue
  fi

  program_id=$(printf "%s\n" "$program_line" | grep -Eo 'O[0-9]{4}' | head -n 1)
  macro_ids+=("$program_id")

  if ! grep -Eq "^${program_id}," "$registry"; then
    echo "[FAIL] Registry is missing entry for program $program_id ($file)"
    fail=1
  fi
done

duplicates=$(tail -n +2 "$registry" | cut -d',' -f1 | sed '/^$/d' | sort | uniq -d)
if [[ -n "$duplicates" ]]; then
  echo "[FAIL] Registry contains duplicate program IDs:"
  printf "%s\n" "$duplicates"
  fail=1
fi

while IFS=',' read -r program_id module purpose status owner last_task last_date; do
  if [[ "$program_id" == "program_id" || -z "$program_id" ]]; then
    continue
  fi

  if [[ ! "$program_id" =~ ^O[0-9]{4}$ ]]; then
    echo "[FAIL] Registry has invalid program ID format: $program_id"
    fail=1
    continue
  fi

  program_num=${program_id#O}
  if (( program_num < 9000 || program_num > 9099 )); then
    echo "[FAIL] Registry has out-of-range program ID: $program_id"
    fail=1
  fi

  if [[ "$status" == "planned" || "$status" == "in_progress" || "$status" == "active" ]]; then
    if ! contains_id "$program_id" "${macro_ids[@]}"; then
      echo "[FAIL] Registry program $program_id is marked $status but no matching .nc file exists"
      fail=1
    fi
  fi
done < "$registry"

if (( fail != 0 )); then
  echo "[FAIL] Registry sync checks failed"
  exit 1
fi

echo "[PASS] Registry sync checks passed"
