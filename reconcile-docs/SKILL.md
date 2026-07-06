---
name: reconcile-docs
description: Check docs/spec.md and docs/build/ phase files against the actual codebase for drift. Use periodically, when something in the docs feels out of date, or before onboarding someone else to the project.
---

# Reconcile Docs

Docs are a map, not the territory. If they disagree with the code, the code
wins. This skill finds where they've quietly diverged — it does not fix
anything on its own.

## Process

1. Read `docs/spec.md` and every file in `docs/build/`.

2. Extract concrete, checkable factual claims — tech choices, data flow
   descriptions, "how X works" statements, file/module references. Ignore
   vague aspirational language; focus on things that can actually be true
   or false against the code.

3. For each claim, check it against the current codebase directly (read
   the relevant files/modules) — do not trust the doc's own description of
   itself.

4. Report mismatches as a short list:
   ```
   - spec.md says auth uses JWT — code now uses server-side sessions
     (see src/auth/session.py). Likely superseded by phase-4 but never
     logged in spec.md's changelog.
   - phase-2.md marked "done" but src/auth/refresh.py doesn't exist —
     refresh token flow may not actually be implemented.
   ```

5. **Do not auto-edit anything.** Present the list and let the user decide
   what to do with each (usually: run `update-spec` for spec drift, or
   append a correction to the relevant phase file).

## When to run this

- Periodically on a long-running project, especially before a break of
  more than a few weeks
- Before generating a `to-prd` handoff doc — a PRD built on stale docs is
  worse than no PRD
- Whenever something in conversation makes you suspect the docs and code
  have quietly diverged
