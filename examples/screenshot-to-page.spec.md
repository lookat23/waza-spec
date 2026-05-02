---
type: task
status: draft
waza_spec_version: 0.1.0
created: 2026-04-30
updated: 2026-04-30
owner: product/frontend
---

# Task Spec: Recreate A Webpage From Screenshots

## Intent

Create a production-quality webpage that closely matches the provided desktop and mobile screenshots while fitting the existing frontend stack and component conventions.

## Context

The task starts from reference screenshots rather than a written design spec. The implementation should first extract layout, typography, colors, spacing, component structure, and responsive behavior from the screenshots. The final result must be checked with browser screenshots, not only lint or build output.

Relevant inputs:

- Desktop reference screenshot
- Mobile reference screenshot
- Existing frontend project files
- Existing design tokens, if present

## Non-Goals

- Do not copy protected logos, brand assets, or commercial illustrations unless the user owns or provides them.
- Do not invent a marketing landing page if the screenshot is an app screen or tool surface.
- Do not add a backend.
- Do not introduce a new design system.

## Decisions

- Use the existing project framework and CSS strategy.
- Analyze screenshots before writing code.
- Use real provided assets when available; otherwise use clear placeholders and record them.
- Verify with desktop and mobile screenshots after implementation.
- Keep visual fixes scoped to the target page and its local components.

## Implementation Plan

- 先读取截图，提取页面结构、视觉层级、颜色、字号、间距和响应式规则。
- 再确认目标项目的前端栈、路由位置、样式策略和可复用组件。
- 按截图实现目标页面，优先保证第一屏结构、主视觉比例和交互控件可用。
- 启动本地 dev server，用桌面和移动视口截图检查偏差。
- 根据截图偏差迭代修正，直到无明显重叠、溢出或响应式破裂。

## Boundaries

### Allowed Changes

- `src/app/**`
- `src/pages/**`
- `src/components/**`
- `src/styles/**`
- `public/**` only for provided or generated assets needed by the page

### Forbidden Changes

- Do not change unrelated routes.
- Do not replace global typography or theme tokens unless the existing app has no usable styling base.
- Do not add new frontend dependencies unless the existing stack cannot support the required interaction.
- Do not leave text overflow or incoherent overlap at common desktop and mobile widths.

### External Dependencies

- Reference screenshots
- Local dev server
- Browser screenshot tool, usually Playwright

## Acceptance Criteria

Scenario: Visual structure matches the desktop screenshot

- Given the page is opened at a desktop viewport
- When a screenshot is captured
- Then the major regions, hierarchy, spacing rhythm, and component proportions match the reference closely
- And no visible text overflows its container

Scenario: Mobile layout is usable

- Given the page is opened at a mobile viewport
- When a screenshot is captured
- Then the layout adapts without horizontal scrolling or overlapping controls
- And the primary workflow remains visible and usable

Scenario: Asset uncertainty is explicit

- Given a logo, product image, icon, or illustration is unclear or missing
- When the page is implemented
- Then the implementation uses an explicit placeholder or provided replacement
- And the Run Log records which assets need final replacement

Scenario: Verification evidence exists

- Given implementation is complete
- When `/check` is run
- Then the final answer includes build or lint status plus browser screenshot verification notes

## Waza Flow

- [ ] Spec created and reviewed
- [ ] `/think` approved the implementation approach if the page has product or architecture ambiguity
- [ ] `/design` analyzed the screenshots and locked visual direction
- [ ] Implementation completed within Boundaries
- [ ] `/hunt` used for rendering, build, or interaction failures
- [ ] `/check` completed before handoff
- [ ] Closeout written

## Run Log

| Date | Actor | Action | Evidence |
|------|-------|--------|----------|
| 2026-04-30 | author | Drafted the screenshot-to-page lifecycle spec | This file |

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
