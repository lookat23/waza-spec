---
name: spec
description: "Creates, reviews, drives, and closes Waza-compatible task specs for larger work. Use when a task needs durable scope, boundaries, acceptance criteria, run logs, or multi-session lifecycle tracking. Not for tiny one-file fixes, pure brainstorming, or deterministic machine verification that requires agent-spec."
when_to_use: "spec, task spec, project spec, lifecycle, run log, closeout, acceptance criteria, boundaries, large task, multi-session task, 规格, 任务规格, 大任务, 生命周期, 验收标准, 边界, 收尾"
metadata:
  version: "0.1.0"
---

# Spec: Carry Large Work Through Waza

Prefix your first line with 🥷 inline, not as its own paragraph.

Use this skill when a task is too large to keep in conversation memory alone. The spec is the durable thread across `/think`, implementation, `/hunt`, `/check`, and closeout.

## Language Rule

This project is Chinese-first for now.

Write most spec content in Chinese. Keep structural keywords in English so the format stays stable and easy for agents to scan:

- frontmatter keys: `type`, `status`, `waza_spec_version`, `created`, `updated`, `owner`
- section names: `Intent`, `Context`, `Non-Goals`, `Decisions`, `Implementation Plan`, `Boundaries`, `Allowed Changes`, `Forbidden Changes`, `External Dependencies`, `Acceptance Criteria`, `Waza Flow`, `Run Log`, `Closeout`
- scenario keywords: `Scenario`, `Given`, `When`, `Then`
- status values, commands, file paths, package names, APIs, framework names, and test names

Do not translate those structural keywords to Chinese unless the user explicitly asks for a Chinese-only document. The body text under those headings should default to natural Chinese.

## Operating Principle

A Waza spec is not a machine verifier. It is a human-readable execution contract:

- what is being built
- what is explicitly not being built
- what decisions are fixed
- where code may change
- how completion is judged
- which Waza skill owns each phase
- what happened during execution
- what risk remains at the end

If the user needs parser-backed lint, lifecycle gates, test selector verification, or CI guard behavior, recommend `agent-spec` instead of pretending Markdown can provide those guarantees.

## Before Touching Files

1. Confirm the working path with `pwd` or `git rev-parse --show-toplevel`.
2. Look for an existing `specs/` directory and any `*.spec.md` files.
3. If a project-level spec exists, read it before creating or reviewing a task spec.
4. If the user gave a vague idea and no repo context, create a draft spec but mark implementation as blocked until context is known.

## Mode Selection

Pick exactly one mode unless the user asks for a full lifecycle pass.

### Create Mode

Use when the user has a rough task and needs a new spec.

Steps:

1. Identify whether the work is spec-worthy. If it is a tiny edit, say so and recommend skipping the spec.
2. Create or update a task spec from `templates/task.spec.md` if available.
3. Fill concrete sections from the user's request and repository context.
4. Leave only explicit unknowns that block implementation, each with an owner and next action.
5. Stop after the draft and ask for approval before implementation planning.

Output:

- path of the created spec
- one-paragraph task summary
- blockers, if any
- recommended next Waza step, usually `/think`

### Review Mode

Use when a spec already exists and needs quality review.

Check:

- Intent is one focused task, not a backlog.
- Context names the existing system surface.
- Decisions are fixed choices, not options.
- Boundaries include allowed changes and forbidden changes.
- Acceptance Criteria are observable and include failure paths when relevant.
- Waza Flow has a clear next step.
- Run Log does not claim work that lacks evidence.
- Closeout is empty unless the task is actually finished.

Lead with findings. Do not rewrite the spec unless the user asks.

### Drive Mode

Use when the user wants to progress an existing spec.

Steps:

1. Read the spec.
2. Identify the current lifecycle stage from Waza Flow, Run Log, and repository state.
3. Recommend the next action:
   - unresolved design choices -> `/think`
   - UI direction or visual implementation -> `/design`
   - implementation failure -> `/hunt`
   - completed implementation -> `/check`
   - verified completion -> close mode
4. If the next action is implementation and the user explicitly asked to proceed, implement only within the stated boundaries.
5. Add a concise Run Log entry after meaningful progress.

Do not silently expand scope. If the needed change is outside Boundaries, pause and ask to revise the spec.

### Close Mode

Use when implementation and review are done.

Write a closeout that records:

- what shipped
- what acceptance criteria were verified
- what changed from the original plan
- what remains out of scope
- residual risk
- follow-up tasks, if any

Do not close a task if `/check` has not run or if known acceptance criteria remain unverified.

## Spec-Worthy Threshold

Recommend a spec when at least two are true:

- touches more than three files
- spans multiple sessions
- has user-visible behavior
- has meaningful non-goals
- needs rollback or migration thinking
- involves UI plus state or backend behavior
- has multiple failure paths
- needs handoff between agents or humans

Recommend skipping a spec when the task is a small local fix, a typo, a dependency bump with obvious tests, or pure exploration.

## Relationship With Waza Skills

- `/think` decides whether the plan is sound.
- `/design` owns product-grade frontend direction.
- `/hunt` owns root-cause debugging.
- `/check` owns pre-merge review and verification evidence.
- `/spec` owns the lifecycle record and scope discipline.

The spec coordinates the skills. It does not replace their judgment.

## Required Sections

A task spec should contain:

- `Intent`
- `Context`
- `Non-Goals`
- `Decisions`
- `Implementation Plan`
- `Boundaries`
- `Acceptance Criteria`
- `Waza Flow`
- `Run Log`
- `Closeout`

If a section is empty, explain why it is empty. Do not leave vague placeholders in an approved spec.

## Output Style

Be direct. For create and close modes, write the file and summarize the result. For review mode, list findings first. For drive mode, state the current stage and the next action.

Keep the lifecycle moving, but do not treat a spec as permission to ignore boundaries.
