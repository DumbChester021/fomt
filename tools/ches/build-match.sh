#!/usr/bin/env bash
set -euo pipefail

repo=$(cd "$(dirname "$0")/../.." && pwd)
cd "$repo"

export DEVKITPRO=${DEVKITPRO:-/opt/devkitpro}
export DEVKITARM=${DEVKITARM:-$DEVKITPRO/devkitARM}

if [ "${1:-}" = "--clean" ]; then
  make clean
fi

if [ ! -f baserom.gba ]; then
  echo 'baserom.gba is missing.' >&2
  exit 1
fi

make compare

printf '\nRetail/base ROM:\n'
sha1sum baserom.gba
printf 'Built ROM:\n'
sha1sum fomt.gba
