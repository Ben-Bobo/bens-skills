---
name: phase-status
description: Update the current build phase doc with progress, decisions, and next steps. Use at the end of a work session, when asked to save progress, or when the user says they're done for the day / wrapping up.
---

# Phase Status

Write a handoff note into the active phase file so a future session (yours
or someone else's) can resume without re-deriving context.

## Process

1. Find the active file under `docs/build/` — usually the most recently
   modified `phase-N.md`. If more than one seems plausibly "active," ask
   which one.

2. Append a new section (don't rewrite existing content):

   ```markdown
   ## Session update — <YYYY-MM-DD>
   - Completed: <what actually got built/finished this session>
   - Decisions: <any choice made and why, so it isn't re-litigated later>
   - Next: <specific enough that a fresh session could pick this up cold —
     not "keep working on auth" but "implement refresh token flow, the
     access token side is done">
   - Open questions: <anything unresolved that needs a human decision>
   ```

3. If the "done when" criteria at the top of the phase file are now fully
   met, note that explicitly: `**Phase complete.**` Don't start the next
   phase file automatically — that's a deliberate `phase-plan` step.

4. If something built this session contradicts or replaces something from
   an *earlier* phase (e.g. swapped out an approach), add one line
   cross-referencing it: `Supersedes the JWT approach from phase-2.`
   Don't go back and edit the old phase file — it's a log, not live state.

5. **Check whether anything logged this session is foundational** — a
   changed goal, constraint, or reversed key decision (not an
   implementation detail). Use the same bar as the `update-spec` skill.
   If yes: don't wait to be asked separately. In this same turn, read
   `docs/spec.md`, draft the changelog entry and section update it needs
   (following `update-spec`'s format), show the user the proposed diff,
   and apply it once they confirm. This is the mechanism that keeps
   spec.md from going stale — it rides along with the habit you already
   have (ending a session), instead of depending on you remembering a
   separate step.
   If nothing foundational happened this session, say so explicitly
   ("nothing spec-worthy this session") so it's clear the check ran.

## Style

- Terse. This is a handoff note, not a narrative — optimize for "what does
  the next session need to know," not completeness.
- Never silently skip the "open questions" line if one exists — unresolved
  questions are the most common cause of wasted time in a new session.
