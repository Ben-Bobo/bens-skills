---
name: to-prd
description: Generate a formal PRD (Product Requirements Document) from docs/spec.md and current phase status, suitable for handing off to another developer or a fresh agent session with no prior context. Use when asked to create a PRD, prepare a handoff doc, or bring on a collaborator.
---

# To PRD

A PRD is a handoff artifact: it must make sense to someone with **zero**
access to the conversations that produced it. That's a higher bar than
`spec.md`, which is written for continuity with yourself.

## Why phases matter here

`spec.md` describes original intent. It does not necessarily reflect what's
actually true today — decisions get superseded in phase files without
always being logged back to the spec (see `update-spec`). A PRD written
from `spec.md` alone risks handing someone a document full of stale
decisions. Phase files are where "what actually happened" lives, so this
skill always reads both.

## Process

1. **Read `docs/spec.md` in full.**

2. **Read every file in `docs/build/`, in order.** For each phase, note:
   - Is it done, in progress, or not started (based on its "done when"
     criteria and session-update entries)?
   - Did anything in this phase supersede or contradict the spec?

3. **Recommend running `reconcile-docs` first** if you notice claims that
   look stale or contradictory between spec and phases, or between phases
   and what you can see of the actual code. Don't silently paper over
   discrepancies in the PRD — surface them to the user before finalizing.

4. **Write the PRD** to `docs/prd.md` (ask before overwriting if one
   already exists — consider `docs/prd/prd-<date>.md` if the user wants a
   version history) using this structure:

   ```markdown
   # PRD: <Project/Feature Name>
   Generated: <date>

   ## Summary
   One paragraph, written for a reader with no prior context.

   ## Problem / Motivation
   Why this exists, what problem it solves, for whom.

   ## Goals
   - From spec.md, restated plainly

   ## Non-goals
   - Explicitly out of scope

   ## Users / stakeholders
   Who this is for, if relevant.

   ## Requirements
   - Functional requirements (what it must do)
   - Non-functional requirements (performance, security, etc., if any
     were specified as constraints)

   ## Current status
   As of <date>, derived from docs/build/:
   - Done: <phases/features complete, per their done-when criteria>
   - In progress: <what's partially built, and what's left>
   - Not started: <what's planned but untouched>

   ## Key decisions & rationale
   Pulled from spec.md's changelog and phase files — decisions that a new
   contributor would otherwise re-litigate or accidentally reverse.

   ## Open questions
   Anything unresolved, from either spec.md or the phase files.

   ## Out of scope
   Anything explicitly decided against, so it doesn't get re-proposed.
   ```

5. **Domain vocabulary**: if `spec.md` has a vocabulary section, fold
   relevant terms into the Summary/Requirements naturally rather than
   dumping a glossary — a PRD reads better as prose than as a reference doc.

## What this skill does NOT do

- Does not publish anywhere (no GitHub issues, no tracker) — it's a local
  file. If you later want that, treat it as a separate, deliberate step.
- Does not edit spec.md or phase files — it only reads them.
