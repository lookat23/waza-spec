---
type: project
status: active
waza_spec_version: 0.1.0
created:
updated:
owner:
---

# Project Spec: <project name>

## Intent

Describe what this project exists to achieve and what kind of work belongs here.

## Product Context

Describe the users, workflows, product surface, and non-negotiable constraints.

## Engineering Context

Describe the stack, repository layout, test commands, build commands, deployment shape, and local development requirements.

## Waza Skill Map

- `/think`: when architectural or product direction needs approval.
- `/design`: when UI, page, component, or visual direction is involved.
- `/hunt`: when tests fail, behavior is wrong, or root cause is unknown.
- `/check`: after implementation and before merge or handoff.
- `/spec`: when work needs durable scope, boundaries, acceptance criteria, or closeout.

## Spec Defaults

### Required Acceptance Shape

- At least one happy path for user-visible work.
- At least one failure or edge path when behavior can fail.
- Observable results over internal intent.

### Boundary Defaults

- Prefer narrow allowed paths.
- State forbidden behavior explicitly.
- Do not add dependencies without a spec revision.

### Verification Defaults

- List the exact commands, screenshots, manual checks, or review artifacts expected before closeout.

## Repository Boundaries

### Usually Allowed

- `src/**`
- `tests/**`
- `docs/**`

### Usually Forbidden

- Generated artifacts unless the task explicitly requires them.
- Lockfile changes unless dependencies changed intentionally.
- Broad refactors unrelated to the task.

## Release And Rollback

Describe how work from this project is released, how rollback happens, and which changes require migration planning.

## Open Project Decisions

- Record open decisions that affect multiple task specs.
