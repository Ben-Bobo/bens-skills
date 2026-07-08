---
name: phase-plan
description: Break down docs/spec.md into vertical-slice build phases under docs/build/phase-N.md. Use after a spec is approved and it's time to start building, or when asked to plan next steps, plan phases, or figure out what to build first.
---

# Phase Plan

Turn an approved `docs/spec.md` into a sequence of concrete, buildable phases.

## Process

1. Read `docs/spec.md` in full. If it doesn't exist yet, say so and suggest
   running `architect` first — don't invent a spec on the fly.

2. Check `docs/build/` for existing phase files so you don't duplicate or
   contradict work already planned or done.

3. **Break work into vertical slices, not horizontal layers.** Each phase
   should be an end-to-end piece of functionality that's independently
   demoable and testable — not "all the backend" then "all the frontend."

   Bad (horizontal):
   - Phase 2: Build all backend auth endpoints
   - Phase 3: Build all frontend auth UI

   Good (vertical):
   - Phase 2: Login flow, end-to-end (API + UI + session persistence)
   - Phase 3: Password reset flow, end-to-end

4. For each phase, create `docs/build/phase-N.md` with:

   ```markdown
   # Phase N: <name>

   ## Plan
   - What this phase builds (end-to-end scope)
   - Depends on: <prior phase, or "none">
   - Done when: <specific, checkable criteria — not "it works" but
     "user can log in, log out, and session survives a page refresh">
   ```

5. **Only create the plan section for the phase(s) the user wants to see
   now.** Don't write out phase-3 through phase-8 speculatively if the user
   just wants to start phase 2 — plans made too far ahead tend to be wrong
   once earlier phases teach you things. It's fine to list future phases
   as a one-line roadmap, but keep detailed planning close to when it'll
   actually be built.

6. Number sequentially. Once a phase is done, its file becomes a historical
   log (see `phase-status`) — don't renumber or delete old ones.

## What this skill does NOT do

- Does not track session-to-session progress within a phase — that's
  `phase-status`.
- Does not touch `spec.md` — if planning phases reveals the spec was wrong
  or incomplete, flag it and suggest `update-spec` rather than editing it
  yourself.
