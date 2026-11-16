#!/usr/bin/env bash
# Copies tstack and pstack into this repo's layout, exactly as published.
# Run it on the `upstream` branch, commit, then merge `upstream` into main.
# Skills named in skills-cut.txt are left out of skills/.
# Usage: scripts/sync-upstream.sh [tstack-ref] [pstack-ref]
set -euo pipefail

TSTACK_REPO=https://github.com/t3dotgg/tstack.git
PSTACK_REPO=https://github.com/backnotprop/pstack.git
TSTACK_REF=${1:-main}
PSTACK_REF=${2:-main}

ROOT=$(cd "$(dirname "$0")/.." && pwd)
TMP=$(mktemp -d)
CUT=$(grep -v -e '^#' -e '^$' "$ROOT/skills-cut.txt" 2>/dev/null || true)
trap 'rm -rf "$TMP"' EXIT

fetch() {
  git init -q "$TMP/$1"
  git -C "$TMP/$1" fetch -q --depth 1 "$2" "$3"
  git -C "$TMP/$1" checkout -q FETCH_HEAD
  rm -rf "$TMP/$1/.git"
}

replace_dir() {
  rm -rf "$2"
  mkdir -p "$2"
  cp -R "$1/." "$2/"
}

# Removes skills an upstream dropped since the last sync, then copies its current ones.
sync_skills() {
  local name=$1 src=$TMP/$1 manifest=$ROOT/upstream/$1/SKILLS.txt
  if [[ -f $manifest ]]; then
    while read -r skill; do
      [[ -d $src/skills/$skill ]] || rm -rf "${ROOT:?}/skills/$skill"
    done <"$manifest"
  fi
  for dir in "$src"/skills/*/; do
    skill=$(basename "$dir")
    if grep -qxF "$skill" <<<"$CUT"; then
      rm -rf "${ROOT:?}/skills/$skill"
    else
      replace_dir "$dir" "$ROOT/skills/$skill"
    fi
  done
}

# Keeps everything else from an upstream for reference; it is not installed.
sync_rest() {
  local name=$1 sha=$2 repo=$3 dst=$ROOT/upstream/$1
  rm -rf "$dst"
  mkdir -p "$dst"
  for entry in "$TMP/$name"/* "$TMP/$name"/.[!.]*; do
    [[ -e $entry ]] || continue
    [[ $(basename "$entry") == skills ]] && continue
    cp -R "$entry" "$dst/"
  done
  ls -1 "$TMP/$name/skills" >"$dst/SKILLS.txt"
  echo "$repo $sha" >"$dst/COMMIT"
}

tstack_sha=$(git ls-remote "$TSTACK_REPO" "$TSTACK_REF" | head -1 | cut -f1)
pstack_sha=$(git ls-remote "$PSTACK_REPO" "$PSTACK_REF" | head -1 | cut -f1)
fetch tstack "$TSTACK_REPO" "${tstack_sha:-$TSTACK_REF}"
fetch pstack "$PSTACK_REPO" "${pstack_sha:-$PSTACK_REF}"
tstack_sha=${tstack_sha:-$TSTACK_REF}
pstack_sha=${pstack_sha:-$PSTACK_REF}

# A skill both upstreams ship would overwrite the other.
clash=$(comm -12 <(ls -1 "$TMP/tstack/skills") <(ls -1 "$TMP/pstack/skills"))
if [[ -n $clash ]]; then
  echo "Both upstreams ship these skills; rename one before syncing:" >&2
  echo "$clash" >&2
  exit 1
fi

mkdir -p "$ROOT/skills"
sync_skills tstack
sync_skills pstack

sync_rest tstack "$tstack_sha" "$TSTACK_REPO"
sync_rest pstack "$pstack_sha" "$PSTACK_REPO"

echo "tstack @ ${tstack_sha:0:7}, pstack @ ${pstack_sha:0:7}"
