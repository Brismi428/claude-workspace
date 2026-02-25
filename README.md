# Claude Workspace

A structured workspace template for running [Claude Code](https://claude.ai/code) as a persistent agent assistant across sessions.

## Why

Every time you start a new Claude Code session, you lose context. This template solves that by giving you:

- A **context system** — files that describe your role, business, strategy, and metrics
- A **session initializer** (`/prime`) — loads all context so Claude is oriented from the first message
- A **plan-then-execute workflow** — structured planning before making changes
- **Example domain commands** — ready-to-use commands for reports, research, and email drafting
- **Bundled skills** — reusable capabilities for creating skills and integrating MCP servers

## Quick Start

1. Clone the repo
2. Copy `.env.example` to `.env` and fill in any API keys you need
3. Fill in your context files in `context/` (role, business, strategy, metrics) — see the fictional examples already there for guidance, then replace with your own info
4. Start a Claude Code session
5. Run `/prime` to load context
6. Try an example command like `/weekly-report` or `/research [topic]`

## Commands

| Command | Purpose |
|---------|---------|
| `/prime` | Initialize session — reads context files, orients Claude |
| `/create-plan [request]` | Create a detailed implementation plan in `plans/` |
| `/implement [plan-path]` | Execute a plan step-by-step |
| `/weekly-report` | Generate a weekly performance and progress summary |
| `/research [topic]` | Deep-dive research with actionable recommendations |
| `/draft-email [recipient] [purpose]` | Draft a professional email aligned with your voice |

## Structure

```
.
├── CLAUDE.md                # Core instructions for Claude (auto-loaded)
├── .env.example             # Template for environment variables
├── .gitignore               # Keeps secrets and generated files out of git
├── context/                 # Your context files
│   ├── personal-info.md     # Role and responsibilities
│   ├── business-info.md     # Organization background
│   ├── strategy.md          # Priorities and goals
│   └── current-data.md      # Key metrics and current state
├── .claude/
│   ├── commands/            # Slash command definitions
│   │   ├── prime.md
│   │   ├── create-plan.md
│   │   ├── implement.md
│   │   ├── weekly-report.md
│   │   ├── research.md
│   │   └── draft-email.md
│   └── skills/              # Bundled skills
│       ├── skill-creator/   # Framework for building new skills
│       └── mcp-integration/ # MCP server integration guide
├── plans/                   # Implementation plans
├── outputs/                 # Work products and deliverables
├── reference/               # Templates and reusable patterns
└── scripts/                 # Automation scripts
```

## Shell Aliases (Optional)

Add quick-launch aliases to your shell profile (see `shell-aliases.md`):

- **`cs`** — Launch Claude Code in safe mode with `/prime`
- **`cr`** — Launch Claude Code in auto-approve mode with `/prime`

Cross-platform instructions (Bash, Zsh, PowerShell, Fish) are in `shell-aliases.md`.

## Customization

The workspace is designed to evolve with you. Use `/create-plan` to plan structural changes and `/implement` to execute them. Claude will keep `CLAUDE.md` updated as the workspace changes.

To add your own commands, create a new `.md` file in `.claude/commands/` and document it in `CLAUDE.md`.