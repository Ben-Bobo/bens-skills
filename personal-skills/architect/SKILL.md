---
name: architect
description: Interrogate the user about a rough idea, feature, or project until ambiguity is resolved, then write or update docs/spec.md. Use when starting a new project, planning a major feature, or when the user wants to think through architecture/requirements before building anything.
---

# Architect

Your job is to turn a rough idea into a clear, thin `docs/spec.md` by asking
good questions first. Do not start writing the spec until you have enough
to write it without guessing.

## Process

1. **Check for an existing spec.** If `docs/spec.md` already exists, read it
   first. If this looks like an update to an existing project rather than a
   brand new one, use the `update-spec` skill's rules instead of overwriting
   this file wholesale.

2. **Interrogate before writing.** Ask about (not necessarily all at once —
   use judgment about what's already answered vs. still open):
   - What problem is this solving, and for whom?
   - What does success look like? How will we know it's done?
   - What's explicitly out of scope?
   - Any hard constraints (tech stack, timeline, must integrate with X)?
   - Any domain-specific vocabulary a stranger reading this wouldn't know?
   - Is this likely to stay solo, or might another developer join later?
     (This affects how formally we write things — see Style below.)

   Keep asking until the ambiguity that would actually cause wrong decisions
   later is resolved. Don't ask questions whose answers don't change what
   gets built.

3. **Write `docs/spec.md`** using this structure:

   ```markdown
   # <Project/Feature Name>

   ## Overview
   One paragraph: what this is and why it exists.

   ## Goals
   - Bullet list of outcomes that define success

   ## Non-goals
   - Explicitly out of scope, so it doesn't get re-litigated later

   ## Constraints
   - Tech stack, timeline, integration requirements, anything non-negotiable

   ## Domain vocabulary
   - Term: definition (only terms a newcomer wouldn't already know)

   ## Key decisions & rationale
   - Decision — why, and what alternative was rejected

   ## Open questions
   - Anything still unresolved, flagged rather than guessed at
   ```

4. **Confirm before finalizing.** Show the user a summary of what you're
   about to write (or the draft itself) before saving, since this document
   becomes the source of truth for every future session.

## Style

- Keep it **thin**. Describe outcomes and constraints, not implementation
  details — those go stale fast and belong in phase docs instead.
- Write the "why" behind decisions, not just the "what." This is what
  makes a spec useful to someone (including future-you) without shared
  context in their head.
- If the user indicated multiple developers might join, err toward being
  slightly more explicit and jargon-defined than you would for pure
  personal notes.

## What this skill does NOT do

- Does not break the spec into build phases — that's `phase-plan`.
- Does not silently rewrite an existing spec — that's `update-spec`.
