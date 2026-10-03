#!/bin/bash
set -euo pipefail

repo_root=$(dirname "$(readlink -f "$0")")/..
agbcc_repo=${FOMT_AGBCC_REPO:-https://github.com/notyourav/agbcc.git}
agbcc_commit=1caa6becde5e4676b59c31c74d68f45ced79557c
compat_patch="$repo_root/tools/agbcp_fomt_compat.patch"
temp=$(mktemp -d)

cleanup() {
    rm -rf "$temp"
}
trap cleanup EXIT

git clone --no-checkout "$agbcc_repo" "$temp"
git -C "$temp" checkout --detach "$agbcc_commit"

actual_commit=$(git -C "$temp" rev-parse HEAD)
if [ "$actual_commit" != "$agbcc_commit" ]; then
    echo "agbcc commit mismatch: expected $agbcc_commit, got $actual_commit" >&2
    exit 1
fi

git -C "$temp" apply --check "$compat_patch"
git -C "$temp" apply "$compat_patch"

(
    cd "$temp"
    ./build.sh
    ./install.sh "$repo_root"
)

agbcp_bin="$repo_root/tools/agbcc/bin/agbcp"
agbcp_real="$repo_root/tools/agbcc/bin/agbcp.bin"

mv -f "$agbcp_bin" "$agbcp_real"

cat > "$agbcp_bin" <<'EOF'
#!/bin/sh
set -eu

bin_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

exec env \
  AGBCC_PRESERVE_USERVAR_COPIES=1 \
  AGBCC_RESTORE_COMBINE_COPY_REFS=1 \
  AGBCC_PRESERVE_LITERAL_POOL_COPY=1 \
  AGBCC_CSE_HOIST_LITERAL_AFTER_BITFIELD_LOAD=1 \
  AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE=1 \
  AGBCC_EXTEND_CALL_RESULT_LIFETIME=1 \
  AGBCC_PRESERVE_INTEGRATED_RETURN_BRIDGE=1 \
  AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS=1 \
  AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1 \
  AGBCC_HOIST_ZERO_AFTER_DEAD_COPY=1 \
  "$bin_dir/agbcp.bin" "$@"
EOF

chmod +x "$agbcp_bin"

echo "Installed pinned FoMT-compatible agbcc toolchain into tools/agbcc"
