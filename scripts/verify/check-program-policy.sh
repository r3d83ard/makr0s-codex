#!/usr/bin/env bash
set -euo pipefail

shopt -s globstar nullglob

required_keys=(
  "Program"
  "Purpose"
  "Machine"
  "Controller"
  "Hardware"
  "Units"
  "Inputs"
  "Outputs"
  "Safety"
  "Revision"
)

files=(macros/oi-mf-plus/**/*.nc)

if (( ${#files[@]} == 0 )); then
  echo "[PASS] No .nc macro files found; skipping policy checks"
  exit 0
fi

fail=0

for file in "${files[@]}"; do
  echo "[INFO] Checking policy for $file"

  for key in "${required_keys[@]}"; do
    if ! grep -Eq "^\\(${key}:[[:space:]].*\\)$" "$file"; then
      echo "[FAIL] $file is missing header key: $key"
      fail=1
    fi
  done

  program_lines=$(grep -E "^\\(Program:[[:space:]]*O[0-9]{4}[[:space:]]*\\)$" "$file" || true)

  if [[ -z "$program_lines" ]]; then
    echo "[FAIL] $file has invalid Program header format; expected '(Program: O####)'"
    fail=1
  else
    line_count=$(printf "%s\n" "$program_lines" | sed '/^$/d' | wc -l | tr -d ' ')

    if [[ "$line_count" != "1" ]]; then
      echo "[FAIL] $file must declare exactly one Program header line"
      fail=1
    fi

    program_id=$(printf "%s\n" "$program_lines" | grep -Eo 'O[0-9]{4}' | head -n 1)
    program_num=${program_id#O}

    if (( program_num < 9000 || program_num > 9099 )); then
      echo "[FAIL] $file has out-of-range Program ID $program_id (expected O9000-O9099)"
      fail=1
    fi
  fi

  if grep -Eiq '(^|[^0-9])M11(1|2)([^0-9]|$)' "$file"; then
    echo "[FAIL] $file contains unsupported M-code M111/M112 for GP-800/WP-600 stack"
    fail=1
  fi
done

if (( fail != 0 )); then
  echo "[FAIL] Program policy checks failed"
  exit 1
fi

echo "[PASS] Program policy checks passed for ${#files[@]} file(s)"
