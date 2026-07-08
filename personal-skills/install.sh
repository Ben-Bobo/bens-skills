#!/usr/bin/env bash
# Symlinks every skill folder in this repo into ~/.claude/skills/.
# Safe to re-run any time (skips ones already linked correctly, and won't
# clobber a real directory or a different symlink without asking).

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.claude/skills"

mkdir -p "$TARGET_DIR"

echo "Linking skills from $REPO_DIR into $TARGET_DIR ..."
echo

for skill_path in "$REPO_DIR"/*/; do
  name="$(basename "$skill_path")"
  link="$TARGET_DIR/$name"

  # skip anything that isn't actually a skill folder
  if [ ! -f "${skill_path}SKILL.md" ]; then
    continue
  fi

  if [ -L "$link" ]; then
    current_target="$(readlink "$link")"
    if [ "$current_target" = "${skill_path%/}" ]; then
      echo "  ✓ $name (already linked)"
      continue
    else
      echo "  ! $name is symlinked elsewhere ($current_target) — skipping. Remove it manually if you want to relink."
      continue
    fi
  elif [ -e "$link" ]; then
    echo "  ! $name already exists as a real file/folder at $link — skipping. Move or remove it manually if you want to link the repo version instead."
    continue
  fi

  ln -s "${skill_path%/}" "$link"
  echo "  + $name -> ${skill_path%/}"
done

echo
echo "Done. Restart Claude Code to pick up any new skills."
