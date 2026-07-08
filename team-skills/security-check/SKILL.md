---
name: security-check
description: Check recently written or modified code for hardcoded secrets, customer data/PII exposure, missing repo setup files (CODEOWNERS/README/.gitignore), and newly introduced dependencies before considering work done. Use before committing, before marking a task complete, before opening a PR, or when explicitly asked to check security.
---

# Security Check

A fast, pattern-level pass over what's changed — not a replacement for
the org's required CI checks (tests, security scans) that gate every PR
merge, and not a replacement for real scanning tools (secret scanners,
SCA tools, SAST). Its job is to catch obvious problems before they leave
a dev's machine or reach PR review, not to be the last line of defense.

Reflects the GitHub org's actual policy (data handling, repo setup) as
documented in the team's GitHub Getting Started Guide — if that document
changes, update this skill to match.

## What to check

Look at files changed in the current session (or the current git diff if
unclear what changed):

1. **Hardcoded secrets** — API keys, connection strings, passwords, tokens,
   private keys pasted directly into code instead of pulled from env vars
   or a secrets manager. Flag anything that looks like a credential, even
   if you're not sure — false positives are cheap, leaked secrets aren't.

2. **Customer data, PII, and customer names** — per org policy: never
   store customer data or PII in the repository, and never use customer
   names in commits, PRs, branch names, or code variables. Flag any of
   these if spotted — in code, in log statements, in commit/branch/PR
   text you're drafting, or in comments. This is a direct policy
   requirement, not a judgment call — flag first, let the human decide
   if it's a false positive.

3. **New dependencies** — any newly added package. Flag it (name + where
   it's used) so the dev can confirm it's approved, rather than silently
   letting it in. Do not attempt to judge license compliance yourself —
   that's a policy call, not a pattern match.

4. **New external calls** — any new outbound HTTP call, new integration,
   or new cloud service usage. Flag it for the same reason as #3 — this
   is a "surface it for a human," not "block it" check.

5. **New repository setup files** — if this looks like a newly created
   repository (first few commits, no history), check whether
   `CODEOWNERS`, `README.md`, and `.gitignore` exist at the root. Per org
   policy these are required within 6 hours of repo creation — flag
   plainly if any are missing rather than assuming someone else will
   catch it. `CODEOWNERS` specifically must assign a GitHub team/group
   (not an individual) and must not be blank — flag a blank or
   individual-only `CODEOWNERS` the same as a missing one.

## How to respond

- Report findings as a short list, grouped by category, with file/line
  references. Don't rewrite the code yourself unless asked.
- If nothing is found, say so plainly rather than staying silent — a
  clean pass should be visible, not implied by absence of comment.
- Never claim this check is comprehensive or a substitute for your org's
  actual security scanning pipeline or required CI checks — this is a
  fast first pass that runs before a PR, not the actual compliance gate.
- If something looks like an active leaked credential (not just a
  pattern that might be one), say so clearly and suggest rotating it
  immediately — don't just note it in a list to review later.

## What this skill does NOT do

- Does not scan the whole repo history for secrets already committed —
  that needs a dedicated tool (e.g. gitleaks/trufflehog), not this skill.
- Does not make approve/deny decisions on dependencies or CUI handling —
  it surfaces, a human or your COE's actual policy decides.
