[![Repo](https://img.shields.io/badge/repo-coe.claude.skills-red?style=for-the-badge)](README.md)

Guardrail skills for Claude Code, shared across the team. Distinct from
personal skills repos - these are **owned and updated by the COE**, and
individual devs pull from this repo read-only rather than pushing changes
directly (see Distribution model below).

## What's here

| Skill | Purpose |
|---|---|
| [`security-check`](./security-check/SKILL.md) | Pattern-level pass for hardcoded secrets, CUI/PII-adjacent logging, and new dependencies/external calls - before a task is considered done. First-pass guardrail, not a replacement for real scanning tools. |
| [`adr`](./adr/SKILL.md) | Records a team-visible architecture decision as a standalone file in `docs/adr/`. Use for team repos where a decision affects more than one person - not for solo projects, where `spec.md` is enough. |
| [`onboard`](./onboard/SKILL.md) | Orients a new dev joining a repo by summarizing what's actually documented (`CLAUDE.md`, README, ADRs) - flags gaps rather than inventing conventions. |
| [`test-strategy`](./test-strategy/SKILL.md) | Establishes what "adequately tested" means for a project (`docs/testing.md`) and flags new code that doesn't meet it, before work is called done. Convention + gap-check, not enforced TDD. |
| [`CLAUDE.md.template`](./CLAUDE.md.template) | Not a skill - a starting `CLAUDE.md` for project repos that wires the above three skills in with clear trigger conditions. |

## Why these four and not more

Deliberately minimal. Each one earns its place by fixing a specific,
recurring team problem:
- `security-check` - catches the class of mistake that's costly if it
  ships (leaked secret, CUI exposure) and cheap to catch early.
- `adr` - team decisions need to survive beyond one person's memory;
  solves the "why did we do it this way" problem without needing everyone
  to edit one shared doc.
- `onboard` - makes ramping up a new hire consistent instead of ad hoc,
  and exposes documentation gaps instead of hiding them.
- `test-strategy` - makes "done" mean the same thing to every dev (and
  every Claude session) instead of everyone guessing at test expectations
  independently. Deliberately convention-and-check, not enforced TDD -
  strict test-first workflow is left as an opt-in per-task choice since it
  actively fights exploratory or UI-heavy work.

Resist the urge to keep adding skills here for every process idea - add
one only when a specific, recurring problem shows up more than once
across the team. That's the same principle as keeping a personal skill
set lean, just applied at team scale.

## Distribution model

Unlike a personal skills repo, this one should be **pulled, not pushed**
by individual devs:

- The COE owns this repo and merges changes (via normal PR review - these
  are policy documents, treat changes to them like you'd treat changes to
  any shared standard).
- Devs clone/pull it and run `install.sh` to symlink into their own
  `~/.claude/skills/`, same mechanism as a personal skills repo.
- If a dev wants to propose a change (a new pattern to flag in
  `security-check`, a new skill), that goes through a PR to this repo,
  not a local edit - otherwise every dev's copy silently drifts.

```bash
git clone <internal-repo-url> ~/dev/team-skills
~/dev/team-skills/install.sh
```

Re-run `install.sh` after every `git pull` to pick up any newly added
skills (it's safe to re-run - see the script's own logic for what it
skips).

## Rolling this out to a growing team

A lightweight way to introduce this without it feeling like a mandate:
1. Pilot on one or two active repos first - add the `CLAUDE.md.template`
   content, symlink the skills, use them for a couple of weeks.
2. Adjust the `security-check` patterns and `CLAUDE.md.template` based on
   what actually triggers false positives or gets ignored.
3. Only then propose it as a standard for new repos / new hires - a
   guardrail nobody trusts because it cried wolf is worse than no
   guardrail.
