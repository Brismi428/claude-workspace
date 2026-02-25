# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## What This Is

This is a **Claude Workspace Template** — a structured environment designed for working with Claude Code as a powerful agent assistant across sessions. The user will spin up fresh Claude Code sessions repeatedly, using `/prime` at the start of each to load essential context without bloat.

**This file (CLAUDE.md) is the foundation.** It is automatically loaded at the start of every session. Keep it current — it is the single source of truth for how Claude should understand and operate within this workspace.

---

## The Claude-User Relationship

Claude operates as an **agent assistant** with access to the workspace folders, context files, commands, and outputs. The relationship is:

- **User**: Defines goals, provides context about their role/function, and directs work through commands
- **Claude**: Reads context, understands the user's objectives, executes commands, produces outputs, and maintains workspace consistency

Claude should always orient itself through `/prime` at session start, then act with full awareness of who the user is, what they're trying to achieve, and how this workspace supports that.

---

## Workspace Structure

```
.
├── CLAUDE.md                # This file — core context, always loaded
├── .env.example             # Template for environment variables (API keys, etc.)
├── .gitignore               # Keeps secrets and generated files out of git
├── .claude/
│   ├── commands/            # Slash commands Claude can execute
│   │       ├── prime.md         # /prime — session initialization
│   │       ├── create-plan.md   # /create-plan — create implementation plans
│   │       ├── implement.md     # /implement — execute plans
│   │       ├── weekly-report.md # /weekly-report — generate weekly summary
│   │       ├── research.md      # /research — deep-dive research on a topic
│   │       └── draft-email.md   # /draft-email — draft a professional email
│   └── skills/              # Reusable skill definitions
├── context/                 # Background context about the user and project
│                            # (User should populate with role, goals, strategies)
├── plans/                   # Implementation plans created by /create-plan
├── outputs/                 # Work products and deliverables
├── reference/               # Templates, examples, reusable patterns
├── scripts/                 # Automation scripts (if applicable)
├── README.md                # Setup and usage guide
└── shell-aliases.md         # Optional shell shortcuts for faster workflows
```

**Key directories:**

| Directory      | Purpose                                                                                                          |
| -------------- | ---------------------------------------------------------------------------------------------------------------- |
| `context/`     | Who the user is, their role, current priorities, strategies. Read by `/prime`.                                    |
| `plans/`       | Detailed implementation plans. Created by `/create-plan`, executed by `/implement`.                               |
| `outputs/`     | Deliverables, analyses, reports, and work products.                                                              |
| `reference/`   | Helpful docs, templates and patterns to assist in various workflows.                                             |
| `scripts/`     | Any automation or tooling scripts.                                                                               |

---

## Commands

### /prime

**Purpose:** Initialize a new session with full context awareness.

Run this at the start of every session. Claude will:

1. Read CLAUDE.md and context files
2. Summarize understanding of the user, workspace, and goals
3. Confirm readiness to assist

### /create-plan [request]

**Purpose:** Create a detailed implementation plan before making changes.

Use when adding new functionality, commands, scripts, or making structural changes. Produces a thorough plan document in `plans/` that captures context, rationale, and step-by-step tasks.

Example: `/create-plan add a competitor analysis command`

### /implement [plan-path]

**Purpose:** Execute a plan created by /create-plan.

Reads the plan, executes each step in order, validates the work, and updates the plan status.

Example: `/implement plans/2026-01-28-competitor-analysis-command.md`

### /weekly-report

**Purpose:** Generate a weekly performance and progress summary.

Reads context files for current metrics and priorities, then produces a formatted report in `outputs/` covering key wins, blockers, metrics movement, and recommendations for the week ahead.

### /research [topic]

**Purpose:** Conduct deep-dive research on a given topic.

Produces a structured research brief in `outputs/` with findings, key takeaways, and actionable recommendations grounded in the user's context and strategic goals.

Example: `/research emerging trends in B2B content marketing`

### /draft-email [recipient] [purpose]

**Purpose:** Draft a professional email aligned with the user's voice and goals.

Uses context files to match tone and strategic positioning, then produces a ready-to-send draft in `outputs/`.

Example: `/draft-email VP of Sales quarterly pipeline review`

---

## Critical Instruction: Maintain This File

**Whenever Claude makes changes to the workspace, Claude MUST consider whether CLAUDE.md needs updating.**

After any change — adding commands, scripts, workflows, or modifying structure — ask:

1. Does this change add new functionality users need to know about?
2. Does it modify the workspace structure documented above?
3. Should a new command be listed?
4. Does context/ need new files to capture this?

If yes to any, update the relevant sections. This file must always reflect the current state of the workspace so future sessions have accurate context.