#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

fail() {
  echo "verify: $*" >&2
  exit 1
}

required_files=(
  "README.md"
  "CLAUDE.md"
  "skills/spec/SKILL.md"
  "templates/task.spec.md"
  "templates/project.spec.md"
  "examples/screenshot-to-page.spec.md"
  "examples/cli-refactor.spec.md"
  "docs/lifecycle.md"
)

for file in "${required_files[@]}"; do
  test -f "$file" || fail "missing required file: $file"
done

skill="skills/spec/SKILL.md"
grep -q '^name: spec$' "$skill" || fail "skill frontmatter must declare name: spec"
grep -q '^description: ' "$skill" || fail "skill frontmatter missing description"
grep -q '^when_to_use: ' "$skill" || fail "skill frontmatter missing when_to_use"
grep -q 'Prefix your first line with 🥷 inline, not as its own paragraph\.' "$skill" || fail "skill missing Waza prefix convention"

for marker in \
  "### Create Mode" \
  "### Review Mode" \
  "### Drive Mode" \
  "### Close Mode" \
  "## Spec-Worthy Threshold" \
  "## Relationship With Waza Skills"
do
  grep -q "^$marker$" "$skill" || fail "skill missing marker: $marker"
done

task_sections=(
  "## Intent"
  "## Context"
  "## Non-Goals"
  "## Decisions"
  "## Implementation Plan"
  "## Boundaries"
  "## Acceptance Criteria"
  "## Waza Flow"
  "## Run Log"
  "## Closeout"
)

for file in templates/task.spec.md examples/*.spec.md; do
  for section in "${task_sections[@]}"; do
    grep -q "^$section$" "$file" || fail "$file missing section: $section"
  done
done

project_sections=(
  "## Intent"
  "## Product Context"
  "## Engineering Context"
  "## Waza Skill Map"
  "## Spec Defaults"
  "## Repository Boundaries"
  "## Release And Rollback"
  "## Open Project Decisions"
)

for section in "${project_sections[@]}"; do
  grep -q "^$section$" templates/project.spec.md || fail "templates/project.spec.md missing section: $section"
done

echo "verify: ok"
