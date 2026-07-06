# claude-skills

Personal Claude Code skills for planning, phase-tracking, and doc hygiene
across projects. No issue-tracker or GitHub integration - these are
lightweight, local-file-only skills meant to be symlinked into
`~/.claude/skills/` on any machine.

## What's here

Run `./install.sh` once after cloning to symlink everything into
`~/.claude/skills/` - see Installation below.

| Skill | Use it when... |
|---|---|
| [`architect`](./architect/SKILL.md) | Starting a new project or major feature. Interrogates you before writing `docs/spec.md`. |
| [`phase-plan`](./phase-plan/SKILL.md) | Spec is approved, time to break it into buildable, end-to-end phases (`docs/build/phase-N.md`). |
| [`phase-status`](./phase-status/SKILL.md) | End of a work session. Logs progress/decisions/next-steps into the active phase file. |
| [`update-spec`](./update-spec/SKILL.md) | A foundational decision changed. Updates `spec.md` deliberately, with a dated changelog - never silently. |
| [`reconcile-docs`](./reconcile-docs/SKILL.md) | Docs feel stale. Checks spec/phase claims against the actual codebase and reports drift (doesn't auto-fix). |
| [`to-prd`](./to-prd/SKILL.md) | Bringing on a collaborator or need a formal handoff doc. Builds a PRD from `spec.md` **and** phase history, so it reflects current reality, not just original intent. |
| [`list-skills`](./list-skills/SKILL.md) | You forgot what's installed. Lists all personal + project skills with descriptions. |

## The doc lifecycle these skills assume

```
architect        →  docs/spec.md            (rare, deliberate changes)
phase-plan       →  docs/build/phase-N.md   (plan section, written once per phase)
phase-status     →  docs/build/phase-N.md   (append-only session log)
update-spec      →  docs/spec.md            (dated changelog entry + section update)
reconcile-docs   →  reports drift, edits nothing
to-prd           →  docs/prd.md              (generated, not hand-maintained)
```

- `spec.md` is a living reference, not a changelog of implementation
  details - it should barely change once written.
- Phase files are append-only logs. Once a phase is done, its file is
  historical record, not live state.
- Nothing runs in the background - a skill only acts when you're in a
  session and invoke it (`/phase-status`) or its description matches
  something you said. Make ending a session with `/phase-status` a habit;
  it now also checks for foundational changes and proposes a spec.md
  update in the same turn, so spec.md doesn't rely on you separately
  remembering to run `update-spec`.

## Installation (new machine)

```bash
git clone https://github.com/<your-username>/claude-skills.git ~/dev/claude-skills
~/dev/claude-skills/install.sh
```

That's it - `install.sh` symlinks every skill folder into
`~/.claude/skills/` for you (safe to re-run any time; it skips ones
already linked and warns instead of overwriting anything unexpected).

This links each skill folder individually rather than the whole directory,
so you can still add ad-hoc, machine-specific skills directly into
`~/.claude/skills/` without touching this repo.

!! **(optional): Copy `CLAUDE-project-example.md` to project level claude.md file to auto-queue skills on session start/end**

##

**Where things actually live, since this trips people up:**
- The real files + git history: `~/dev/claude-skills/` - this is where
  you `git add` / `commit` / `push` / `pull` from, always.
- `~/.claude/skills/<name>`: just a symlink (a pointer), not a copy. Claude
  Code reads from here, but you never run git commands in this folder.
- GitHub: the remote copy you sync with via push/pull.

## Updating a skill

Edit the file in `~/dev/claude-skills/`, commit, push. Since
`~/.claude/skills/<name>` is a symlink to that folder, the change is live
immediately everywhere the repo is cloned+symlinked - just `git pull` on
other machines. Restart the Claude Code session to pick up edits (skills
load at session start).

## Adding a new skill

```bash
mkdir ~/dev/claude-skills/<new-skill-name>
# write SKILL.md, commit, push
ln -s ~/dev/claude-skills/<new-skill-name> ~/.claude/skills/<new-skill-name>
```

Add a row to the table above.
