---
name: update-spec
description: Update docs/spec.md when a foundational project decision or requirement changes. Use when asked to update the spec, when a phase's work contradicts what spec.md currently says, or when the user says a requirement changed.
---

# Update Spec

`spec.md` should change rarely and deliberately — never as a side effect of
routine coding. This skill exists so updates are visible and don't silently
erase the reasoning behind earlier decisions.

## When to actually update the spec

Update it for **foundational** changes only:
- A goal or non-goal changed
- A core constraint changed (tech stack, scope, target users)
- A key decision was reversed (e.g. switched auth strategy, changed data model approach)
- New domain vocabulary needs defining

Do NOT update the spec for:
- Implementation details (those belong in phase docs, not the spec)
- Anything that's still in flux / not yet decided (that's an open question,
  not a spec change)

If you're not sure whether something is foundational enough to warrant a
spec change, ask the user rather than guessing.

## Process

1. Read the current `docs/spec.md` in full.

2. Identify exactly what changed and why. If this came out of work done in
   a phase file, read that phase file's relevant entry so the rationale is
   accurate, not reconstructed from memory.

3. **Don't rewrite prose in place.** Add a dated entry to a running log at
   the top of the file:

   ```markdown
   ## Changes since v1
   - 2026-07-10: Switched auth from JWT to server-side sessions —
     JWT made token revocation unworkable once we needed instant logout.
     See phase-4.
   ```

4. Only after logging the change, update the relevant section below (e.g.
   the Constraints or Key decisions section) to reflect the new reality —
   so a fresh reader gets the current picture, while the changelog explains
   how we got here.

5. If the change invalidates something an *existing* phase file assumed,
   flag it — don't edit the old phase file, just note the discrepancy so
   the user can decide whether to revisit that phase's work.

## Style

- Keep the changelog terse — one line per change, dated, with a pointer to
  the phase file that prompted it if applicable.
- Never delete history from the changelog. It's append-only, same as phase
  files.
