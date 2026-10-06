#!/usr/bin/env bash
set -euo pipefail

repo=$(cd "$(dirname "$0")/../.." && pwd)
cd "$repo"

expected=$(awk '{print $1}' fomt.sha1)

printf '%s\n' 'FoMT decomp overview'
printf '%s\n' '===================='
printf 'Repo:      %s\n' "$repo"
printf 'Branch:    %s\n' "$(git branch --show-current)"
printf 'Commit:    %s\n' "$(git log -1 --format='%h %s')"
printf 'Expected:  %s\n' "$expected"

if [ -f baserom.gba ]; then
  printf 'Base ROM:  %s\n' "$(sha1sum baserom.gba | awk '{print $1}')"
else
  printf 'Base ROM:  MISSING\n'
fi

if [ -f fomt.gba ]; then
  built=$(sha1sum fomt.gba | awk '{print $1}')
  printf 'Built ROM: %s' "$built"
  if [ "$built" = "$expected" ]; then
    printf '  [MATCH]\n'
  else
    printf '  [MODIFIED / NOT MATCHING]\n'
  fi
else
  printf 'Built ROM: not built yet\n'
fi

printf '\nFiles\n-----\n'
printf 'C/C++ source files: %s\n' "$(find src -maxdepth 1 -type f \( -name '*.c' -o -name '*.cc' \) | wc -l)"
printf 'Assembly files:     %s\n' "$(find asm -type f -name '*.s' | wc -l)"
printf 'Headers:            %s\n' "$(find include -type f \( -name '*.h' -o -name '*.hh' \) | wc -l)"

printf '\nLargest readable source modules\n-------------------------------\n'
wc -l src/*.cc src/*.c 2>/dev/null | sort -nr | sed -n '2,11p'

printf '\nLargest remaining assembly modules\n----------------------------------\n'
wc -l asm/*.s asm/data/*.s 2>/dev/null | sort -nr | sed -n '2,11p'

printf '\nGit status\n----------\n'
git status --short --branch

printf '\nStart reading: START_HERE.md\n'
