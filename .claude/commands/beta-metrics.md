# Beta Metrics

Pull and analyze current beta program metrics from Supabase.

## Variables

- focus: $ARGUMENTS (optional — "engagement", "retention", "feedback", "subscriptions", or leave blank for full overview)

## Instructions

### Step 1: Context

Read these files:
- context/current-data.md — last known metrics snapshot
- context/strategy.md — targets to measure against

### Step 2: Query Metrics

Run these SQL queries against Supabase using the mcp__supabase-new__execute_sql tool.

**Core counts:**

    SELECT COUNT(*) as total_users,
      COUNT(*) FILTER (WHERE is_beta_tester = true) as beta_testers,
      COUNT(*) FILTER (WHERE onboarding_completed = true) as onboarded
    FROM profiles;

**Subscription breakdown:**

    SELECT p.name as plan_name, s.status, COUNT(*) as count
    FROM subscriptions s JOIN products p ON s.product_id = p.id
    GROUP BY p.name, s.status ORDER BY p.name;

**Engagement (last 7 days):**

    SELECT 'events' as metric, COUNT(*) as total, COUNT(DISTINCT user_id) as unique_users
    FROM events WHERE created_at > NOW() - INTERVAL '7 days'
    UNION ALL
    SELECT 'tasks', COUNT(*), COUNT(DISTINCT user_id)
    FROM tasks WHERE created_at > NOW() - INTERVAL '7 days'
    UNION ALL
    SELECT 'meal_plans', COUNT(*), COUNT(DISTINCT user_id)
    FROM meal_plans WHERE created_at > NOW() - INTERVAL '7 days';

**Village activity:**

    SELECT COUNT(*) FILTER (WHERE status = 'accepted') as active_connections,
      COUNT(*) FILTER (WHERE status = 'pending') as pending_connections
    FROM village_connections;

**Beta feedback:**

    SELECT type, COUNT(*) as count FROM beta_feedback GROUP BY type ORDER BY count DESC;

**Recent signups:**

    SELECT email, is_beta_tester, onboarding_completed, created_at
    FROM profiles ORDER BY created_at DESC LIMIT 10;

### Step 3: Analyze

Compare metrics against targets from context/strategy.md:

| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| WAEU (60% of beta testers) | [calc] | [from data] | On track / Behind / Ahead |
| Week 1 Retention (80%) | 80% | [from data] | On track / Behind / Ahead |
| Free to Plus Conversion (15%) | 15% | [from data] | On track / Behind / Ahead |

Identify:
1. **Wins** — metrics trending well
2. **Concerns** — metrics below target or declining
3. **Signals** — patterns that suggest what to build or fix next

### Step 4: Output

Save to: outputs/beta-metrics-YYYY-MM-DD.md

### Step 5: Update Context

Suggest specific updates to context/current-data.md with the fresh numbers. Ask the user if they want to apply the updates.

### Step 6: Summary

Provide the 3 most important takeaways verbally.
