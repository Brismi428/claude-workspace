# Launch Readiness

Assess Kinroot readiness for expanding beyond closed beta toward public launch.

## Variables

- scope: $ARGUMENTS (optional — "full" for comprehensive review, "product", "marketing", "operations", or a specific area)

## Instructions

### Step 1: Context

Read all context files:
- context/business-info.md
- context/personal-info.md
- context/strategy.md
- context/current-data.md
- reference/competitive-landscape.md

### Step 2: Product Readiness

Evaluate against these criteria:

**Core stability:**
- [ ] All 5 modules functional (Root Planner, Kin Calendar, Mealflow, Village Network, Taskboard)
- [ ] Onboarding flow complete and tested
- [ ] Free to Plus upgrade path works end-to-end
- [ ] Stripe payments processing reliably
- [ ] Email notifications delivering
- [ ] Push notifications working
- [ ] Mobile experience is usable (responsive, touch targets, performance)

**Beta feedback resolution:**
- [ ] Critical bugs resolved
- [ ] Top UX friction points addressed
- [ ] Feature requests triaged and prioritized

**Premium Plus readiness:**
- [ ] AI features implemented (meal suggestions, smart scheduling)
- [ ] Premium Plus tier activatable in Stripe
- [ ] Clear value differentiation from Plus

### Step 3: Marketing Readiness

- [ ] Landing page communicates value clearly
- [ ] Pricing page complete with plan comparison
- [ ] Content strategy defined (blog, social, email)
- [ ] SEO foundation in place (meta tags, sitemap, target keywords)
- [ ] Social media presence established
- [ ] Email waitlist/capture functional
- [ ] Launch market(s) identified (Brooklyn, Portland, Austin, Seattle, SF)

### Step 4: Operations Readiness

- [ ] Support system in place (n8n automation, knowledge base)
- [ ] Admin dashboard functional for user management
- [ ] Moderation tools ready for Village Network scale
- [ ] Error monitoring active (Sentry)
- [ ] Rate limiting configured
- [ ] Data export and account deletion working (compliance)
- [ ] Privacy policy and terms of service published

### Step 5: Analyze Gaps

For each item that is not ready:
1. How critical is it for launch? (Blocker / Important / Nice-to-have)
2. Estimated effort to complete (Small / Medium / Large)
3. Suggested priority order

### Step 6: Output

Save to: outputs/launch-readiness-YYYY-MM-DD.md

Structure:
1. **Overall Assessment** — Ready / Almost Ready / Not Ready
2. **Scorecard** — Product / Marketing / Operations rated Green / Yellow / Red
3. **Blockers** — Must fix before launch
4. **High Priority** — Should fix before launch
5. **Nice to Have** — Can ship after launch
6. **Recommended Launch Timeline** — Based on gap analysis
7. **Next Steps** — Specific actions in priority order

### Step 7: Summary

State the overall readiness level and the top 3 blockers verbally.
