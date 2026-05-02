# waza-spec

[English](README.md) | 简体中文

面向较大型中文优先任务的 Waza 兼容任务规格。

`waza-spec` 是一个轻量的生命周期层，适合那些已经喜欢 Waza 工作方式、但还需要一个稳定位置来保存范围、决策、边界、验收标准和执行历史的项目。

当前目标用户是中文优先用户。Spec 保留 `Intent`、`Boundaries`、`Scenario`、`Given`、`When`、`Then` 等英文结构关键词，但实际任务内容通常应使用中文编写。

它从 Markdown 优先开始：模板、一个 skill、示例和一套有纪律的工作流。如果这套工作流在真实项目中证明有用，之后可以再加入 CLI。

## 为什么需要

Waza 很擅长处理工程动作：

- `/think` 在写代码前压测方案
- `/hunt` 在修复前找到根因
- `/check` 在合并前审查工作
- `/design` 让前端工作保持有意图的设计

大型任务还需要额外一层。计划需要跨多轮会话、实现偏移、调试、审查和收尾继续存在。`waza-spec` 给这个任务一个稳定的家。

## 生命周期

```text
create spec -> /think -> implement -> /hunt if needed -> /check -> close
```

Spec 是把这些动作串起来的线索。它记录任务是什么、不是什么、哪些文件可以改、如何判断完成、执行过程中发生了什么，以及收尾后还剩下什么。

## 快速开始

复制任务模板：

```bash
mkdir -p specs
cp templates/task.spec.md specs/my-task.spec.md
```

然后使用 skill：

```text
waza spec create a task spec for this feature
waza spec review specs/my-task.spec.md
waza spec drive specs/my-task.spec.md
waza spec close specs/my-task.spec.md
```

在项目通过 skill registry 发布之前，可以通过复制或软链接把 skill 安装到你的 agent skill 目录：

```bash
# Codex
mkdir -p ~/.codex/skills
ln -s "$(pwd)/skills/spec" ~/.codex/skills/spec

# Claude Code
mkdir -p ~/.claude/skills
ln -s "$(pwd)/skills/spec" ~/.claude/skills/spec
```

## 目录结构

```text
skills/
  spec/
    SKILL.md              # Waza 兼容生命周期 skill
templates/
  task.spec.md            # 单任务模板
  project.spec.md         # 项目级上下文模板
examples/
  screenshot-to-page.spec.md
  cli-refactor.spec.md
docs/
  lifecycle.md
scripts/
  verify.sh              # 维护者一致性检查
```

## 设计原则

- Spec 用于大型或容易漂移的工作，不是每一次小修改都需要。
- 人可读的 Markdown 优先于机器可读的 DSL。
- Waza skills 保持独立。Spec 负责协调它们，而不是替代它们。
- 验收标准应该是可观察的。如果没人能检查，它就不应该出现在完成条件里。
- 边界应该写明文件、目录、行为和明确的非目标。
- 收尾很重要。只有把偏差和剩余风险写清楚，任务才算完成。

## 状态

v0.1 有意保持很小：

- 一个 `spec` skill
- 两个模板
- 两个示例 spec
- 生命周期文档

目前还没有 CLI、解析器、验证器或包管理器集成。

仓库维护时运行：

```bash
./scripts/verify.sh
```

## 许可证

MIT
