# Feature Spec Template

Use this template when speccing out a new Kinroot feature. Copy this file, rename it, and fill in each section.

---

# Feature: [Feature Name]

**Author:** Brian Smith
**Date:** [YYYY-MM-DD]
**Status:** Draft | In Review | Approved | In Progress | Shipped
**Module:** Root Planner | Kin Calendar | Mealflow | Village Network | Taskboard | Settings | New

---

## Problem

What pain point does this solve? Who feels it? How do they cope today?

[2-3 sentences grounded in real user behavior, not hypotheticals]

---

## Solution

What are we building? Describe the feature from the user's perspective.

[Write as if explaining to a beta tester: "When you open [page], you'll see [thing], and you can [action]."]

---

## Subscription Tier

Which tiers get this feature?

| Tier | Access |
|------|--------|
| Free | [Yes / No / Limited] |
| Plus | [Yes / No] |
| Premium Plus | [Yes / No] |

---

## User Stories

- As a parent, I want to [action] so that [outcome].
- As a parent, I want to [action] so that [outcome].

---

## Design Notes

- Where does this live in the app? (URL path, sidebar placement)
- What existing patterns should it follow? (e.g., dialog style, card layout)
- Mobile considerations?
- Dark mode considerations?

---

## Technical Approach

### Database Changes

```sql
-- New tables or columns needed
-- Always include RLS:
-- ALTER TABLE [table] ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "..." ON [table] FOR ALL USING (auth.uid() = user_id);
```

### API Routes

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/[resource]` | [What it returns] |
| POST | `/api/v1/[resource]` | [What it creates] |

### Components

| Component | Location | Description |
|-----------|----------|-------------|
| [Name] | `src/components/features/[module]/` | [What it renders] |

### Subscription Enforcement

How are tier limits enforced? (API-level checks, UI gating, or both)

---

## Edge Cases

- What happens if [boundary condition]?
- What happens if [empty state]?
- What happens if [error state]?

---

## Success Metrics

How do we know this feature is working?

| Metric | Target | How Measured |
|--------|--------|--------------|
| [Metric] | [Target] | [Supabase query / analytics event / manual check] |

---

## Out of Scope

What are we explicitly NOT building in this version?

- [Thing we're not doing yet]
- [Thing we're not doing yet]

---

## Open Questions

- [ ] [Decision that needs input]
- [ ] [Decision that needs input]
