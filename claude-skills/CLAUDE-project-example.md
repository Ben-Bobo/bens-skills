\## Project docs



This project tracks context in:

\- `docs/spec.md` — goals, constraints, key decisions. Rarely changes.

\- `docs/build/phase-N.md` — one file per build phase, append-only session logs.



At the \*\*start of every session\*\*, before doing any work:

1\. Read `docs/spec.md`.

2\. Read the most recently modified file in `docs/build/` to see current

&#x20;  progress, decisions, and open questions.



At the \*\*end of a session\*\*, when the user indicates they're wrapping up,

proactively suggest running `/phase-status` if it hasn't been run yet.



If `docs/spec.md` doesn't exist yet, this is a new project — suggest

running `/architect` before writing any code.

