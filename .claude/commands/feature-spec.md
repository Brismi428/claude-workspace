# Feature Spec

Create a detailed feature specification for a new Kinroot feature.

## Variables

- feature: $ARGUMENTS (required — describe the feature, e.g., "Google Calendar sync", "AI meal suggestions", "recurring tasks")

## Instructions

### Step 1: Context

Read these files to understand the product and technical landscape:
- context/business-info.md — product overview and modules
- context/strategy.md — current priorities (is this feature aligned?)
- reference/feature-spec-template.md — the template to follow
- reference/competitive-landscape.md — how competitors handle this

### Step 2: Research

Think through:
1. Which Kinroot module does this feature belong to? (Root Planner, Kin Calendar, Mealflow, Village Network, Taskboard, Settings, or New)
2. Which subscription tier(s) should have access?
3. What database changes are needed? (Remember: RLS required on all tables, use API routes for limit enforcement)
4. What API routes are needed? (Use /api/v1/ pattern)
5. What components need to be created or modified?
6. How does this interact with existing features?
7. What are the edge cases? (Empty states, error states, subscription limits, mobile)

### Step 3: Write the Spec

Use the template from reference/feature-spec-template.md. Fill in every section with specific, actionable content.

**Kinroot-specific rules:**
- Kids are data, not users — features never assume children log in
- Single-user only — no sharing, no multi-user coordination
- Privacy-first — if location data is involved, use fuzzy geolocation (3-mile randomization)
- Date handling — always use local timezone, never UTC
- Tier enforcement — API-level checks, not just UI gating
- Database — always include ALTER TABLE ... ENABLE ROW LEVEL SECURITY and CREATE POLICY statements

### Step 4: Output

Save to: outputs/feature-spec-YYYY-MM-DD-{feature-slug}.md

### Step 5: Summary

Provide:
1. One-line summary of the feature
2. Estimated complexity (small / medium / large)
3. Which existing files would be modified
4. Any open questions that need answers before implementation
