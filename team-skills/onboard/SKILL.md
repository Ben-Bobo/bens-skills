---
name: onboard
description: Orient a new developer joining an existing repo — summarize conventions, architecture decisions, and where to find things. Use when a new team member says they're new to the codebase, or when explicitly asked to help someone get oriented.
---

# Onboard

Give a new dev a fast, accurate lay of the land — this is a summarizer,
not a tutorial generator. Don't invent conventions that aren't actually
established in the repo.

This is codebase orientation, not org access setup — check the
prerequisite in step 0 first, since a new dev without GitHub access
or team membership can't act on anything else here yet.

## Process

0. **Check org access is sorted first.** If the person indicates they
   don't yet have GitHub access or a team assignment, point them to the
   org's own access process (GitHub account in the org's required format,
   the team access request form, role selection) before going further —
   this skill covers the codebase, not org onboarding, and the two are
   easy to conflate.

1. **Read what actually exists**, in this order, and skip anything that
   isn't present rather than treating its absence as a problem to solve:
   - `CLAUDE.md` (project-level) — stated conventions and policies
   - `README.md` — stated purpose, setup steps
   - `CODEOWNERS` — who reviews what; tell the new dev which team(s) own
     the areas they're likely to touch, since this determines who their
     PRs get routed to
   - `docs/adr/` — architecture decisions, most recent first, since these
     explain "why is it built this way" faster than reading code
   - `docs/spec.md` / `docs/build/` if present — active project context

2. **Summarize, don't dump.** Produce a short orientation covering:
   - What this project does, in one or two sentences
   - Key conventions the dev needs to follow (coding standards, PR
     process, required checks) — pulled from `CLAUDE.md`, not guessed
   - Who owns review for the areas they'll likely work in, per
     `CODEOWNERS`
   - The 2-3 most consequential architecture decisions (from ADRs, if
     present) that would trip someone up if they didn't know about them
   - Where to look for more detail on anything, rather than restating it
     all inline

3. **Flag gaps instead of filling them.** If there's no `CLAUDE.md`, no
   ADRs, no `CODEOWNERS`, no README setup section — say so explicitly
   ("this repo doesn't have documented conventions yet") rather than
   presenting guesses as fact. A new dev acting on a hallucinated
   convention is worse than one who knows the docs don't exist yet. A
   missing `CODEOWNERS` is also a policy gap worth flagging on its own,
   not just a documentation nicety.

4. Offer, don't assume: ask if they want a walkthrough of a specific part
   of the codebase next, rather than trying to explain everything at once.

## What this skill does NOT do

- Does not handle org-level access requests, account setup, or role
  assignment — that's a prerequisite process owned outside this skill
  (see step 0).
- Does not set up local dev environment / install dependencies — that's
  a project-specific setup script, not this skill's job.
- Does not create missing docs on the new dev's behalf — if `CLAUDE.md`,
  `CODEOWNERS`, or ADRs don't exist, that's a signal for whoever owns the
  repo to add them, not something to backfill mid-onboarding.
