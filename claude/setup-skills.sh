#!/usr/bin/env bash
#
# Populate ~/.claude/skills as a REAL directory of symlinks.
#
# Two independent sources feed it:
#   - authored skills versioned in this dotfiles repo (claude/skills/*)
#   - installed skills fetched by `npx skills@latest add <repo>` into ~/.agents/skills/*
#
# ~/.claude/skills itself must stay a real directory (not a symlink into this
# repo): the npx installer writes RELATIVE symlinks (../../.agents/skills/<name>)
# that only resolve when their parent is the real ~/.claude/skills. This script
# is the deterministic bridge and does not depend on the installer's own linking.
#
# Idempotent: safe to run repeatedly. Run via dotbot's shell step, or directly.
set -euo pipefail

DOTFILES_SKILLS="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"
AGENTS_SKILLS="$HOME/.agents/skills"
DEST="$HOME/.claude/skills"

# Replace a legacy whole-directory symlink with a real directory.
if [ -L "$DEST" ]; then
  rm -f "$DEST"
fi
mkdir -p "$DEST"

# Drop symlinks left over from a previous run whose target no longer exists.
find "$DEST" -maxdepth 1 -type l ! -exec test -e {} \; -delete 2>/dev/null || true

link_all() {
  local src="$1"
  [ -d "$src" ] || return 0
  for dir in "$src"/*/; do
    [ -d "$dir" ] || continue
    ln -sfn "$src/$(basename "$dir")" "$DEST/$(basename "$dir")"
  done
}

# Installed skills first, authored skills second so hand-written skills win
# on any name clash.
link_all "$AGENTS_SKILLS"
link_all "$DOTFILES_SKILLS"

echo "Linked $(find "$DEST" -maxdepth 1 -type l | wc -l | tr -d ' ') skills into $DEST"
