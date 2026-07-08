---
name: adr
description: Record a significant architecture or technical decision as a new Architecture Decision Record under docs/adr/. Use when a team makes a real technical choice worth preserving (framework, pattern, integration approach, tradeoff) — not for personal notes or single-dev projects, where spec.md/phase docs are enough.
---

# ADR (Architecture Decision Record)

For team codebases, decisions need to survive beyond one person's memory
or one person's `spec.md`. ADRs are small, append-only, one-per-decision —
this avoids the multi-editor conflict problem of everyone trying to keep
one shared spec file current.

## When to use this vs. spec.md / update-spec

- **Solo project, one dev** → keep using `spec.md` + `update-spec`. Don't
  add ADR overhead for something one person can hold in their head.
- **Team codebase, decision affects more than one person's work** → use
  this. Examples: choosing a library, deciding on an API contract, a
  pattern for handling a recurring problem, a tradeoff between two
  approaches that a future dev might reasonably question or reverse.

Not every decision needs an ADR. Use judgment: if it's the kind of thing
a new hire would ask "wait, why did we do it this way?" — write it down.
If it's an implementation detail with no real alternative considered,
skip it.

## Process

1. Check `docs/adr/` for existing records and the next available number
   (e.g. `0001-`, `0002-`...). If the folder doesn't exist, create it.

2. Create `docs/adr/NNNN-short-title.md`:

   ```markdown
   # NNNN. <Short title of the decision>

   Date: <YYYY-MM-DD>
   Status: Accepted

   ## Context
   What problem or question prompted this decision. Be honest about
   constraints (timeline, existing tech, team skillset) — future readers
   need the real reasons, not the tidy version.

   ## Decision
   What was decided, stated plainly.

   ## Alternatives considered
   What else was on the table, and why it was rejected. This is often
   the most valuable part for a future reader who's tempted to "fix"
   something that was already deliberately ruled out.

   ## Consequences
   What this makes easier, what it makes harder, what it locks in.
   ```

3. **Never edit an old ADR to reflect a new decision.** If a later
   decision reverses or replaces an earlier one, write a new ADR and set
   the old one's status to `Superseded by NNNN` — don't rewrite history.

## Style

- Short. An ADR that takes more than a few minutes to read won't get read.
- Write the "why," not just the "what" — that's the entire point of this
  existing instead of just being a Slack message that scrolls away.
