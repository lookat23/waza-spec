# waza-spec

English | [简体中文](README.zh-CN.md)

Waza-compatible task specs for larger Chinese-first work.

`waza-spec` is a lightweight lifecycle layer for projects that already like Waza's taste but need a durable place to hold scope, decisions, boundaries, acceptance criteria, and execution history.

The current target user is Chinese-first. Specs keep English structural keywords such as `Intent`, `Boundaries`, `Scenario`, `Given`, `When`, and `Then`, while the actual task content should usually be written in Chinese.

It starts Markdown-first: templates, one skill, examples, and a disciplined workflow. A CLI can come later if the workflow proves useful across real projects.

## Why

Waza is excellent at engineering moves:

- `/think` pressure-tests a plan before code
- `/hunt` finds root cause before fixes
- `/check` reviews work before merging
- `/design` keeps frontend work intentional

Large tasks need one more layer. A plan needs to survive multiple sessions, implementation drift, debugging, review, and closeout. `waza-spec` gives that task a home.

## Lifecycle

```text
create spec -> /think -> implement -> /hunt if needed -> /check -> close
```

The spec is the thread that ties those moves together. It records what the task is, what it is not, which files may change, how completion is judged, what happened during execution, and what remains after closeout.

## Quick Start

Copy the task template:

```bash
mkdir -p specs
cp templates/task.spec.md specs/my-task.spec.md
```

Then use the skill:

```text
waza spec create a task spec for this feature
waza spec review specs/my-task.spec.md
waza spec drive specs/my-task.spec.md
waza spec close specs/my-task.spec.md
```

Until the project is published through a skill registry, install the skill locally by copying or symlinking it into your agent's skill directory:

```bash
# Codex
mkdir -p ~/.codex/skills
ln -s "$(pwd)/skills/spec" ~/.codex/skills/spec

# Claude Code
mkdir -p ~/.claude/skills
ln -s "$(pwd)/skills/spec" ~/.claude/skills/spec
```

## Structure

```text
skills/
  spec/
    SKILL.md              # Waza-compatible lifecycle skill
templates/
  task.spec.md            # Single-task template
  project.spec.md         # Project-level context template
examples/
  screenshot-to-page.spec.md
  cli-refactor.spec.md
docs/
  lifecycle.md
scripts/
  verify.sh              # maintainer consistency check
```

## Design Principles

- Specs are for large or drift-prone work, not every edit.
- Human-readable Markdown comes before machine-readable DSL.
- Waza skills remain independent. The spec coordinates them; it does not replace them.
- Acceptance criteria should be observable. If nobody can check it, it does not belong in completion.
- Boundaries should name files, directories, behaviors, and explicit non-goals.
- Closeout matters. A task is not done until deviations and remaining risk are written down.

## Status

v0.1 is intentionally small:

- one `spec` skill
- two templates
- two example specs
- lifecycle documentation

No CLI, no parser, no verifier, no package manager integration yet.

For repo maintenance, run:

```bash
./scripts/verify.sh
```

## License

MIT
