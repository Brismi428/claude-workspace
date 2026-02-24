# Claude Workspace

A structured workspace template for running [Claude Code](https://claude.ai/code) as a persistent agent assistant across multiple sessions.

## Why

Every time you start a new Claude Code session, you lose context. This template solves that by giving you:

- A **context system** — files that describe your role, business, strategy, and metrics
- A **session initializer** (`/prime`) — loads all context so Claude is oriented from the first message
- A **plan-then-execute workflow** — structured planning before making changes
- **Bundled skills** — reusable capabilities for creating skills and integrating MCP servers

## Quick Start

1. Clone the repo
2. Fill in your context files in `context/` (role, business, strategy, metrics)
3. Start a Claude Code session
4. Run `/prime` to load context

## Commands

| Command | Purpose |
|---------|---------|
| `/prime` | Initialize session — reads context files, orients Claude |
| `/create-plan [request]` | Create a detailed implementation plan in `plans/` |
| `/implement [plan-path]` | Execute a plan step-by-step |

## Structure

```
├── CLAUDE.md              # Core instructions for Claude (auto-loaded)
├── context/               # Your context files
│   ├── personal-info.md   # Role and responsibilities
│   ├── business-info.md   # Organization background
│   ├── strategy.md        # Priorities and goals
│   └── current-data.md    # Key metrics and current state
├── .claude/
│   ├── commands/          # Slash command definitions
│   └── skills/            # Bundled skills
│       ├── skill-creator/ # Framework for building new skills
│       └── mcp-integration/ # MCP server integration guide
├── plans/                 # Implementation plans
├── outputs/               # Work products and deliverables
├── reference/             # Templates and reusable patterns
└── scripts/               # Automation scripts
```

## Shell Aliases (Optional)

Add quick-launch aliases to your shell profile (see `shell-aliases.md`):

- **`cs`** — Launch Claude Code in safe mode with `/prime`
- **`cr`** — Launch Claude Code in auto-approve mode with `/prime`

## Customization

The workspace is designed to evolve with you. Use `/create-plan` to plan structural changes and `/implement` to execute them. Claude will keep `CLAUDE.md` updated as the workspace changes.
