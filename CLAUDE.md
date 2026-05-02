# waza-spec

Markdown-first task lifecycle for Waza-style agent work.

## Repository Shape

```text
skills/spec/SKILL.md       # the only skill in v0.1
templates/task.spec.md     # task-level spec scaffold
templates/project.spec.md  # project-level context scaffold
examples/*.spec.md         # realistic examples
docs/lifecycle.md          # operating model
scripts/verify.sh          # deterministic repository consistency check
```

## Editing Rules

- Keep structural keywords in English, but write task spec body content in Chinese by default.
- Keep Chinese trigger phrases in `when_to_use` where useful.
- Do not add a CLI until two real tasks have been run through the lifecycle.
- Do not introduce a parser or verifier in v0.1.
- Do not claim machine verification. This project is a human-readable lifecycle layer.
- Keep examples realistic enough to expose workflow problems.

## Spec Philosophy

A spec is not a planning essay. It is the durable task contract that survives across sessions:

- Intent says what and why.
- Context says what already exists.
- Decisions say what is fixed.
- Boundaries say what can and cannot change.
- Acceptance Criteria say how completion is checked.
- Waza Flow says which skill should be used at each phase.
- Run Log records what happened.
- Closeout records the final state and remaining risk.

## Done For v0.1 Changes

Before finishing edits in this repo:

1. Check that every template contains the required sections.
2. Check that `skills/spec/SKILL.md` still covers create, review, drive, and close modes.
3. Keep `README.md`, `docs/lifecycle.md`, and examples aligned with the current lifecycle.
4. Run `./scripts/verify.sh`.
