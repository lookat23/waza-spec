---
type: task
status: draft
waza_spec_version: 0.1.0
created:
updated:
owner:
---

# Task Spec: <task name>

## Intent

用一段中文说明这个任务要做什么、为什么要做。只描述一个聚焦任务，不写成 backlog。

## Context

说明当前产品、代码路径、用户流程或系统行为的背景。这里要让后续会话不用重新猜上下文。

如果有相关文件、issue、截图、文档、历史决策，把路径或链接写在这里。

## Non-Goals

- 列出本任务明确不做的事情。
- 把容易顺手扩张的相邻功能写清楚，避免实现时跑偏。

## Decisions

- 记录已经确定的产品或技术选择。
- 不要把仍在讨论的选项写成决策。
- 关键值要具体：路径、flag、endpoint、断点、文案、时间、数量限制。

## Implementation Plan

- 用中文列出推荐实现顺序。
- 这里只写阶段和要点，不写长篇设计说明。
- 如果方案还没经过 `/think`，标明“等待 `/think` 确认”。

## Boundaries

### Allowed Changes

- `path/or/module/**`

### Forbidden Changes

- 不要修改无关行为。
- 除非修订本 spec，不要新增运行时依赖。

### External Dependencies

- 列出完成任务需要的服务、API、CLI、账号、密钥或资产。
- 如果没有外部依赖，写 `None`。

## Acceptance Criteria

Scenario: Happy path

- Given 初始状态
- When 用户或系统执行某个动作
- Then 可以观察到的结果成立

Scenario: Important failure or edge path

- Given 相关失败条件或边界条件
- When 尝试执行该动作
- Then 可以观察到的错误处理或边界结果成立

## Waza Flow

- [ ] Spec created and reviewed
- [ ] `/think` approved the implementation approach
- [ ] Implementation completed within Boundaries
- [ ] `/hunt` used for any blocking bug or unexpected behavior
- [ ] `/check` completed before merge or handoff
- [ ] Closeout written

## Run Log

| Date | Actor | Action | Evidence |
|------|-------|--------|----------|
|      |       |        |          |

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
