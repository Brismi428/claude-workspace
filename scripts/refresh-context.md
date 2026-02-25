# Refresh Context Data

Guide for updating `context/current-data.md` with live metrics.

## Option 1: Via Claude Code (Recommended)

Run `/beta-metrics` — it queries Supabase directly and suggests updates to `current-data.md`.

## Option 2: Via Supabase Dashboard

1. Open the Supabase SQL Editor
2. Run the queries from `scripts/pull-metrics.sql` one at a time
3. Update the relevant sections in `context/current-data.md`

## Option 3: Via MCP in Claude Code

Run individual queries using the Supabase MCP tool:

```
mcp__supabase-new__execute_sql({ query: "SELECT COUNT(*) FROM profiles WHERE is_beta_tester = true" })
```

## What to Update

After pulling fresh data, update these sections in `context/current-data.md`:

- **Key Metrics table** — user counts, module counts
- **Current State section** — any status changes (new features shipped, bugs fixed)
- **Revenue Targets** — if subscription data changed

## When to Refresh

- Before any `/weekly-report` or `/launch-readiness` run
- After a batch of beta testers is invited
- After a major feature ships
- Weekly at minimum during active beta
