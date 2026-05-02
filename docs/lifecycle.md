# Waza Spec Lifecycle

`waza-spec` gives large tasks a durable lifecycle without turning Waza into a heavy specification system.

## Phase 1: Create

Create a task spec when the work is large enough to drift.

Use a spec when at least two are true:

- the task touches more than three files
- the task spans multiple sessions
- the task has user-visible behavior
- the task has meaningful non-goals
- the task needs rollback or migration thinking
- the task involves UI plus state or backend behavior
- the task has multiple failure paths
- the task needs handoff between agents or humans

Do not use a spec for typo fixes, obvious one-file changes, pure research, or exploratory spikes where done cannot yet be defined.

## Phase 2: Think

Run Waza `/think` after the draft spec exists and before implementation if there are meaningful product, architecture, or boundary decisions.

The spec should provide `/think` with:

- Intent
- Context
- Decisions already fixed
- Boundaries
- Acceptance Criteria
- External dependencies

`/think` should return an approved approach or name the blocker. If `/think` changes scope, revise the spec before implementing.

## Phase 3: Implement

Implementation should stay inside the Boundaries section.

If required work falls outside the allowed paths or contradicts a forbidden change, pause and revise the spec. Do not treat implementation convenience as permission to expand scope.

After meaningful progress, add a Run Log entry with evidence:

- command output
- screenshot path
- test name
- diff summary
- review note
- issue link

## Phase 4: Hunt

Use `/hunt` when behavior is wrong, tests fail, rendering breaks, or the root cause is unknown.

Do not turn the spec into a bug diary. The spec should record the short result:

- what failed
- root cause found by `/hunt`
- fix applied or blocker remaining
- evidence after fix

## Phase 5: Check

Use `/check` after implementation and before handoff.

`/check` should verify:

- the diff stays within Boundaries
- Acceptance Criteria have evidence
- tests or manual checks match the spec
- no broad unrelated refactor was introduced
- residual risk is known

If `/check` finds issues, fix them and update the Run Log.

## Phase 6: Close

Closeout is the final state of the task, not a celebration note.

Write:

- what shipped
- what was verified
- what deviated from the original spec
- what remains out of scope
- what risk remains
- what follow-up tasks exist

Do not close if known Acceptance Criteria are unverified.

## Relation To agent-spec

`agent-spec` is the right tool when you need deterministic contract verification:

- parser-backed spec validation
- lint scoring
- explicit test selectors
- boundary verification
- lifecycle and guard commands
- CI integration

`waza-spec` is the right starting point when you want Waza's taste and workflow discipline without adding a binary dependency.

The two can coexist. A future version of `waza-spec` can export or link to `agent-spec` contracts for tasks that need machine verification.
