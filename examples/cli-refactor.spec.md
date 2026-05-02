---
type: task
status: draft
waza_spec_version: 0.1.0
created: 2026-04-30
updated: 2026-04-30
owner: cli/platform
---

# Task Spec: Refactor A CLI Command Without Changing Behavior

## Intent

Refactor one existing CLI command so the implementation is easier to maintain while preserving the command contract users already rely on.

## Context

The command currently mixes argument parsing, business logic, output formatting, and file-system side effects in one module. The task should separate responsibilities without changing flags, stdout, stderr, exit codes, or file output behavior.

Relevant inputs:

- Existing command implementation
- Existing tests
- README or help text documenting command behavior
- Any examples in docs or scripts

## Non-Goals

- Do not add new flags.
- Do not rename the command.
- Do not change output formats.
- Do not migrate unrelated commands.
- Do not introduce a new CLI framework.

## Decisions

- Preserve the public CLI contract exactly.
- Extract internal helpers only when they reduce real duplication or isolate side effects.
- Keep the existing test runner and fixture style.
- Add regression coverage for stdout, stderr, exit code, and output files before changing behavior-sensitive code.

## Implementation Plan

- 先捕获现有命令的代表性 stdout、stderr、exit code 和文件输出行为。
- 为稳定行为补回归测试，尤其覆盖失败路径和 help 输出。
- 再拆分参数解析、业务逻辑、输出格式化和文件副作用。
- 每拆一层就运行相关 CLI 测试，确认公开行为没有变化。
- 最后用 `/check` 检查是否引入了无关重构或边界外改动。

## Boundaries

### Allowed Changes

- `src/cli/<command>/**`
- `src/commands/<command>/**`
- `tests/cli/<command>/**`
- `docs/cli/<command>.md` only if existing docs are wrong or incomplete

### Forbidden Changes

- Do not change unrelated command modules.
- Do not change global argument parsing.
- Do not update lockfiles unless a dependency change is approved by revising this spec.
- Do not alter documented behavior to make tests easier.

### External Dependencies

- None

## Acceptance Criteria

Scenario: Existing happy path output is preserved

- Given the command is run with a representative valid input
- When stdout, stderr, exit code, and file outputs are captured
- Then they match the pre-refactor behavior

Scenario: Existing failure behavior is preserved

- Given the command is run with invalid input
- When stdout, stderr, and exit code are captured
- Then the same error class, user-facing message, and exit code are produced

Scenario: Help text remains stable

- Given the command help is printed
- When the help output is captured
- Then existing flags, defaults, examples, and descriptions remain present

Scenario: Internal code is easier to maintain

- Given the refactor is complete
- When `/check` reviews the diff
- Then responsibilities are separated without broad unrelated rewrites
- And new helper boundaries have tests or are covered through command-level tests

## Waza Flow

- [ ] Spec created and reviewed
- [ ] `/think` approved the refactor approach
- [ ] Implementation completed within Boundaries
- [ ] `/hunt` used for failing tests or behavior mismatches
- [ ] `/check` completed before merge or handoff
- [ ] Closeout written

## Run Log

| Date | Actor | Action | Evidence |
|------|-------|--------|----------|
| 2026-04-30 | author | Drafted the CLI refactor lifecycle spec | This file |

## Closeout

### Shipped

Not closed yet.

### Verified

Not closed yet.

### Deviations

Not closed yet.

### Remaining Risk

Not closed yet.

### Follow-Ups

Not closed yet.
