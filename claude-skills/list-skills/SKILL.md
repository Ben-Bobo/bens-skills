---
name: list-skills
description: List all installed Claude Code skills, personal and project-level, with their descriptions. Use when asked what skills are available, what commands exist, or "what can you do here."
---

# List Skills

Show every skill Claude Code can currently see, so the user doesn't have to
remember what's installed.

## Process

1. Check both locations:
   - Personal: `~/.claude/skills/`
   - Project: `.claude/skills/` (relative to the current project root)

2. For each `<skill-name>/SKILL.md` found, read only the YAML frontmatter
   (`name` and `description`) — no need to load the full body.

3. Present as a simple table, grouped by scope:

   ```markdown
   ## Personal skills (~/.claude/skills/)
   | Skill | Description |
   |---|---|
   | architect | Interrogate the user about a rough idea... |
   | phase-plan | Break down docs/spec.md into vertical-slice... |

   ## Project skills (.claude/skills/)
   | Skill | Description |
   |---|---|
   | ... | ... |
   ```

4. If a project-level skill has the same name as a personal one, note that
   the project version takes priority (Claude Code's documented behavior),
   rather than listing both as if independent.

5. If neither directory has any skills, say so plainly rather than
   returning an empty table.

## Notes

- This skill only reads metadata — it should never need to execute
  anything from the skills it's listing.
- Keep the output scannable. This is meant to answer "what do I have"
  in a few seconds, not to reproduce each skill's full instructions.
