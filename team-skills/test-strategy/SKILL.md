---
name: test-strategy
description: Establish testing conventions for a project — deterministic tests AND, for agent/LLM components, evals (rubrics, golden datasets, LLM-as-judge) — and check new code against them before work is considered done. Use when setting up testing conventions for a new project, or before marking a task/phase complete.
---

# Test Strategy

Two jobs: write down what "adequately tested" means for this project once,
then check new work against it. This is convention + gap-flagging, not
enforced TDD — see the note at the bottom if strict test-first workflow is
what's actually wanted for a given task.

## Job 1: Establish conventions (once per project)

1. Check for `docs/testing.md`. If it exists, use it — don't re-derive.

2. If it doesn't exist, look at what's actually in the repo before asking
   anything — check for existing test files, test runner config, CI config
   — to avoid asking questions the codebase already answers.

3. Determine if this project has probabilistic/LLM components (agent
   calls, prompts, RAG, anything where output isn't a fixed expected
   value). If so, conventions need **two distinct sections**, not one —
   see the template below. Deterministic tests and evals fail in
   different ways and get checked differently; conflating them under one
   "testing" heading causes people to apply exact-match thinking to
   probabilistic output, which doesn't work.

4. For anything not already evident, ask (keep it tight, not a full
   interview):
   - What layers need deterministic test coverage — unit only, or
     integration/e2e for critical paths too?
   - If there are LLM/agent components: is there a golden dataset or
     rubric already, or does one need to be created? What's the
     pass/fail or threshold criteria (exact match rarely applies here)?
   - What's explicitly exempt — trivial glue code, generated code,
     one-off scripts?
   - Any existing mocking/fixture conventions to follow?

5. Write `docs/testing.md`:

   ```markdown
   # Testing conventions

   ## Tools
   <framework(s), runner, how to run locally and in CI>

   ## Deterministic tests
   ### What must be tested
   <e.g. "all new business logic," "API endpoints," specific critical paths>
   ### What's exempt
   <e.g. trivial getters/setters, generated code, throwaway scripts>
   ### Structure & naming
   <file location conventions, naming patterns>
   ### Mocking / fixtures
   <conventions for test data, mocks, fixtures>

   ## Evals (only if this project has LLM/agent components)
   ### What gets evaluated
   <which agent behaviors, prompts, or pipelines need eval coverage>
   ### Method
   <rubric-based scoring, LLM-as-judge, golden dataset comparison — which,
   and why>
   ### Pass criteria
   <threshold + tolerance, not exact match — e.g. "score >= 0.8 on rubric X"
   or "matches golden output within semantic similarity threshold">
   ### Cadence
   <fast subset on every PR vs. full eval suite nightly/on-demand — evals
   are usually too slow/costly to run in full on every PR>
   ```

6. Keep it short. This is a policy reference, not a tutorial — a dev or a
   fresh Claude session should be able to read it in under a minute.

## Job 2: Check new work against it (ongoing)

1. Before code is considered done (a task, a phase, a PR), read
   `docs/testing.md` and compare against what was actually written.

2. Flag gaps plainly: "this touches business logic in `X` but has no
   corresponding test" — don't silently let it pass, and don't
   auto-write exhaustive tests unless asked to.

3. For LLM/agent components specifically, flag differently than for
   deterministic code: "this changes the agent's tool-use logic but
   there's no eval covering that path" is a different kind of gap than a
   missing unit test, and shouldn't be waved through just because a
   traditional unit test would be hard to write for it.

4. If `docs/testing.md` doesn't exist yet, say so and offer to run Job 1
   rather than silently skipping the check.

5. If this project uses `phase-plan`, treat "meets `docs/testing.md`" as
   an implicit part of any phase's "done when" criteria, even if not
   spelled out per-phase.

## On strict TDD (opt-in, not default)

This skill does not enforce write-test-first-then-implement. That
workflow is genuinely valuable for isolated, well-specified logic, but
actively fights exploratory or UI-heavy work where the right test isn't
obvious until the implementation exists. If a task is the right shape for
it, the user can explicitly ask for a strict red-green-refactor approach
for that task — treat it as a per-task request, not a standing rule.

## What this skill does NOT do

- Does not replace real test-quality review (assertions that actually
  test behavior vs. tests that just execute code) — that still needs
  human or code-review judgment.
- Does not write a full test suite (or eval suite) unprompted — it flags
  gaps and lets the user decide what to act on now vs. later; ask
  explicitly when you want tests/evals actually written.
- Does not replace a real eval framework/harness if the project needs
  one at scale — this skill establishes what should be evaluated and how,
  it doesn't run the evals itself.

## On CI

Deterministic tests belong in a CI gate the normal way. Evals for
agent/LLM components can and should be in CI too, but with different
pass criteria than a deterministic test — threshold + tolerance rather
than exact match, and often a fast subset per-PR with the full golden
dataset run on a slower cadence (nightly, pre-release) since full eval
suites are usually too slow/costly to run on every commit. This skill
itself (the gap-check) is a dev-side pre-PR habit, not a CI gate — it's
non-deterministic and advisory by nature, which is fine for a dev
checking their own work but not a substitute for the actual deterministic
test suite or eval harness that runs in CI.
