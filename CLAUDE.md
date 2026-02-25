# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## What This Is

This is the **Kinroot Claude Workspace** — a structured environment designed for working with Claude Code as a powerful agent assistant for Kinroot's Co-Founder & COO. The workspace provides persistent context about Kinroot (product, strategy, metrics) so Claude can act as an informed thought partner across sessions.

Use `/prime` at the start of each session to load essential context without bloat.

**This file (CLAUDE.md) is the foundation.** It is automatically loaded at the start of every session. Keep it current — it is the single source of truth for how Claude should understand and operate within this workspace.

---

## The Claude-User Relationship

Claude operates as an **agent assistant** with access to the workspace folders, context files, commands, and outputs. The relationship is:

- **User**: Defines goals, provides context about their role/function, and directs work through commands
- **Claude**: Reads context, understands the user's objectives, executes commands, produces outputs, and maintains workspace consistency

Claude should always orient itself through `/prime` at session start, then act with full awareness of who the user is, what they're trying to achieve, and how this workspace supports that.

---

## Kinroot Quick Context

**Kinroot** is a personal household OS for parents carrying the mental load. Single-user, privacy-first, subscription-funded.

- **Modules:** Root Planner (dashboard), Kin Calendar, Mealflow, Village Network, Taskboard
- **Tiers:** Free ($0, 1 child) | Plus ($12.99/mo, unlimited) | Premium Plus ($24.99/mo, AI features)
- **Stage:** Closed beta, 17 testers
- **Stack:** Next.js 15 + React 19 + Supabase + Stripe + Tailwind CSS v4 + shadcn/ui
- **Paradigm:** Kids are data, not users. No multi-user. No co-parenting coordination.

---

## Workspace Structure

    .
    CLAUDE.md                 # This file — core context, always loaded
    .env.example              # Template for environment variables
    .gitignore                # Keeps secrets and generated files out of git
    .claude/
      commands/               # Slash commands Claude can execute
        prime.md              # /prime — session initialization
        create-plan.md        # /create-plan — create implementation plans
        implement.md          # /implement — execute plans
        weekly-report.md      # /weekly-report — weekly progress summary
        research.md           # /research — deep-dive research
        draft-email.md        # /draft-email — draft professional email
        beta-update.md        # /beta-update — beta tester communications
        beta-metrics.md       # /beta-metrics — pull and analyze beta data
        feature-spec.md       # /feature-spec — write feature specifications
        competitor-analysis.md # /competitor-analysis — competitive research
        content-brief.md      # /content-brief — marketing content creation
        launch-readiness.md   # /launch-readiness — launch readiness assessment
      skills/                 # Reusable skill definitions
        skill-creator/        # Framework for building new skills
        mcp-integration/      # MCP server integration guide
    context/                  # Background context about Kinroot and your role
      personal-info.md        # Your role as Co-Founder & COO
      business-info.md        # Kinroot product, modules, pricing, stage
      strategy.md             # Q1 2026 priorities and targets
      current-data.md         # Key metrics snapshot (refresh regularly)
    reference/                # Templates, brand guidelines, competitive intel
      brand-voice.md          # Voice pillars, tone, writing rules, module names
      email-templates.md      # Reusable email templates for beta comms
      feature-spec-template.md # Template for writing feature specs
      competitive-landscape.md # Competitor profiles, SWOT, pricing context
    scripts/                  # Automation and data queries
      pull-metrics.sql        # Supabase SQL queries for all key metrics
      refresh-context.md      # Guide for updating current-data.md
    plans/                    # Implementation plans created by /create-plan
    outputs/                  # Work products and deliverables
    README.md                 # Setup and usage guide
    shell-aliases.md          # Optional shell shortcuts for faster workflows

---

## Commands

### Session Management

| Command | Purpose |
|---------|---------|
| /prime | Initialize session — loads context, confirms readiness |
| /create-plan [request] | Create a detailed implementation plan in plans/ |
| /implement [plan-path] | Execute a plan step-by-step |

### General Purpose

| Command | Purpose |
|---------|---------|
| /weekly-report | Generate weekly progress and performance summary |
| /research [topic] | Deep-dive research with actionable recommendations |
| /draft-email [recipient] [purpose] | Draft a professional email in your voice |

### Kinroot-Specific

| Command | Purpose |
|---------|---------|
| /beta-update [type] | Draft beta tester comms (weekly, feedback-request, monthly-recap, milestone) |
| /beta-metrics [focus] | Pull live Supabase data and analyze beta program health |
| /feature-spec [feature] | Write a full feature specification with DB schema, API design, and components |
| /competitor-analysis [target] | Research and analyze a competitor against Kinroot positioning |
| /content-brief [request] | Create marketing content (blog, social, landing page copy) aligned with brand voice |
| /launch-readiness [scope] | Assess product, marketing, and operations readiness for launch |

---

## Reference Files

| File | Use When |
|------|----------|
| reference/brand-voice.md | Writing any external-facing content (emails, blog, social, copy) |
| reference/email-templates.md | Drafting beta comms or marketing emails |
| reference/feature-spec-template.md | Speccing out a new feature |
| reference/competitive-landscape.md | Positioning, marketing, or feature prioritization discussions |

---

## Scripts

| File | Purpose |
|------|---------|
| scripts/pull-metrics.sql | SQL queries for all key Kinroot metrics — run via Supabase dashboard or MCP |
| scripts/refresh-context.md | Guide for updating context/current-data.md with fresh data |

---

## Critical Instruction: Maintain This File

**Whenever Claude makes changes to the workspace, Claude MUST consider whether CLAUDE.md needs updating.**

After any change — adding commands, scripts, workflows, or modifying structure — ask:

1. Does this change add new functionality users need to know about?
2. Does it modify the workspace structure documented above?
3. Should a new command be listed?
4. Does context/ need new files to capture this?

If yes to any, update the relevant sections. This file must always reflect the current state of the workspace so future sessions have accurate context.
