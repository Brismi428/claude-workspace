-- Kinroot Beta Metrics Queries
-- Run these via Supabase dashboard SQL editor or mcp__supabase-new__execute_sql
-- Copy results into context/current-data.md to keep metrics fresh

-- ============================================
-- 1. USER & BETA TESTER COUNTS
-- ============================================
SELECT
  COUNT(*) as total_users,
  COUNT(*) FILTER (WHERE is_beta_tester = true) as beta_testers,
  COUNT(*) FILTER (WHERE onboarding_completed = true) as onboarded,
  COUNT(*) FILTER (WHERE created_at > NOW() - INTERVAL '7 days') as signups_last_7d,
  COUNT(*) FILTER (WHERE created_at > NOW() - INTERVAL '30 days') as signups_last_30d
FROM profiles;

-- ============================================
-- 2. SUBSCRIPTION BREAKDOWN
-- ============================================
SELECT
  p.name as plan_name,
  s.status,
  COUNT(*) as count
FROM subscriptions s
JOIN products p ON s.product_id = p.id
GROUP BY p.name, s.status
ORDER BY p.name, s.status;

-- ============================================
-- 3. WEEKLY ENGAGEMENT (last 7 days)
-- ============================================

-- Calendar events created
SELECT 'events_created' as metric,
  COUNT(*) as total,
  COUNT(DISTINCT user_id) as unique_users
FROM events
WHERE created_at > NOW() - INTERVAL '7 days';

-- Tasks created
SELECT 'tasks_created' as metric,
  COUNT(*) as total,
  COUNT(DISTINCT user_id) as unique_users
FROM tasks
WHERE created_at > NOW() - INTERVAL '7 days';

-- Meal plans created
SELECT 'meal_plans_created' as metric,
  COUNT(*) as total,
  COUNT(DISTINCT user_id) as unique_users
FROM meal_plans
WHERE created_at > NOW() - INTERVAL '7 days';

-- Children added
SELECT 'children_added' as metric,
  COUNT(*) as total,
  COUNT(DISTINCT user_id) as unique_users
FROM children
WHERE created_at > NOW() - INTERVAL '7 days';

-- ============================================
-- 4. VILLAGE NETWORK ACTIVITY
-- ============================================
SELECT
  COUNT(*) FILTER (WHERE status = 'accepted') as active_connections,
  COUNT(*) FILTER (WHERE status = 'pending') as pending_connections,
  COUNT(*) FILTER (WHERE status = 'declined') as declined_connections,
  COUNT(*) FILTER (WHERE status = 'blocked') as blocked_connections
FROM village_connections;

SELECT 'village_messages_7d' as metric,
  COUNT(*) as total,
  COUNT(DISTINCT sender_id) as unique_senders
FROM village_messages
WHERE created_at > NOW() - INTERVAL '7 days';

SELECT 'forum_posts_7d' as metric,
  COUNT(*) as total,
  COUNT(DISTINCT author_id) as unique_authors
FROM forum_posts
WHERE created_at > NOW() - INTERVAL '7 days';

-- ============================================
-- 5. BETA FEEDBACK SUMMARY
-- ============================================
SELECT
  type,
  COUNT(*) as count
FROM beta_feedback
GROUP BY type
ORDER BY count DESC;

-- ============================================
-- 6. FEATURE FLAG STATUS
-- ============================================
SELECT
  flag_key,
  flag_name,
  is_enabled,
  rollout_percentage,
  maintenance_mode
FROM feature_flags
ORDER BY flag_key;

-- ============================================
-- 7. RECENT SIGNUPS (last 10)
-- ============================================
SELECT
  email,
  is_beta_tester,
  onboarding_completed,
  created_at
FROM profiles
ORDER BY created_at DESC
LIMIT 10;

-- ============================================
-- 8. CONTENT TOTALS (all time)
-- ============================================
SELECT 'total_events' as metric, COUNT(*) as count FROM events
UNION ALL
SELECT 'total_tasks', COUNT(*) FROM tasks
UNION ALL
SELECT 'total_meals', COUNT(*) FROM meals
UNION ALL
SELECT 'total_meal_plans', COUNT(*) FROM meal_plans
UNION ALL
SELECT 'total_children', COUNT(*) FROM children
UNION ALL
SELECT 'total_forum_posts', COUNT(*) FROM forum_posts
UNION ALL
SELECT 'total_village_messages', COUNT(*) FROM village_messages;
