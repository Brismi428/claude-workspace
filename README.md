# Kinroot Claude Workspace

A structured workspace for running [Claude Code](https://claude.ai/code) as a persistent agent assistant for Kinroot — the household OS for parents carrying the mental load.

## Why

Every time you start a new Claude Code session, you lose context. This workspace solves that by giving you:

- A **context system** — files that describe your role, Kinroot product, strategy, and metrics
- A **session initializer** (/prime) — loads all context so Claude is oriented from the first message
- A **plan-then-execute workflow** — structured planning before making changes
- **Kinroot-specific commands** — beta management, feature specs, competitive analysis, content creation, launch readiness
- **Reference library** — brand voice guide, email templates, feature spec template, competitive landscape
- **Metrics scripts** — SQL queries to pull live data from Supabase

## Quick Start

1. Clone the repo
2. Copy .env.example to .env and fill in your API keys
3. Review context files in context/ — update if anything has changed
4. Start a Claude Code session
5. Run /prime to load context
6. Try /beta-metrics to pull live data or /content-brief blog post about meal planning for busy parents

## Commands

### Session Management

| Command | Purpose |
|---------|---------|
| /prime | Initialize session — reads context files, orients Claude |
| /create-plan [request] | Create a detailed implementation plan in plans/ |
| /implement [plan-path] | Execute a plan step-by-step |

### General Purpose

| Command | Purpose |
|---------|---------|
| /weekly-report | Generate a weekly performance and progress summary |
| /research [topic] | Deep-dive research with actionable recommendations |
| /draft-email [recipient] [purpose] | Draft a professional email aligned with your voice |

### Kinroot-Specific

| Command | Purpose |
|---------|---------|
| /beta-update [type] | Draft beta tester comms (weekly, feedback-request, monthly-recap, milestone) |
| /beta-metrics [focus] | Query Supabase for live metrics and analyze beta health |
| /feature-spec [feature] | Write a full feature specification |
| /competitor-analysis [target] | Research and analyze a competitor |
| /content-brief [request] | Create marketing content (blog, social, landing page) |
| /launch-readiness [scope] | Assess readiness for public launch |

## Structure

    .
    CLAUDE.md                     # Core instructions for Claude (auto-loaded)
    .env.example                  # Template for environment variables
    .gitignore
    context/                      # Your context files
      personal-info.md            # Role as Co-Founder & COO
      business-info.md            # Kinroot product, modules, pricing
      strategy.md                 # Q1 2026 priorities and targets
      current-data.md             # Key metrics snapshot
    reference/                    # Brand guidelines, templates, competitive intel
      brand-voice.md              # Voice pillars, tone, writing rules
      email-templates.md          # Reusable email templates
      feature-spec-template.md    # Feature specification template
      competitive-landscape.md    # Competitor profiles and positioning
    scripts/                      # Automation and data queries
      pull-metrics.sql            # Supabase SQL queries for key metrics
      refresh-context.md          # Guide for updating metrics
    .claude/
      commands/                   # Slash command definitions (12 commands)
      skills/                     # Bundled skills
        skill-creator/            # Framework for building new skills
        mcp-integration/          # MCP server integration guide
    plans/                        # Implementation plans
    outputs/                      # Work products and deliverables
    shell-aliases.md              # Optional shell shortcuts

## Shell Aliases (Optional)

Add quick-launch aliases to your shell profile (see shell-aliases.md):

- **cs** — Launch Claude Code in safe mode with /prime
- **cr** — Launch Claude Code in auto-approve mode with /prime

Cross-platform instructions (Bash, Zsh, PowerShell, Fish) are in shell-aliases.md.

## Keeping Context Fresh

Metrics in context/current-data.md are a snapshot. To refresh:

1. Run /beta-metrics — queries Supabase directly and suggests updates
2. Or manually run queries from scripts/pull-metrics.sql in the Supabase dashboard

See scripts/refresh-context.md for the full guide.

## Customization

The workspace is designed to evolve with you. Use /create-plan to plan structural changes and /implement to execute them. Claude will keep CLAUDE.md updated as the workspace changes.

To add your own commands, create a new .md file in .claude/commands/ and document it in CLAUDE.md.
