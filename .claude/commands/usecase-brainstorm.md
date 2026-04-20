---
description: Generate 30-60 story angles for the product, grouped by category
argument-hint: <topic-slug>
---

# Brainstorm Story Angles

Generate a broad volume of **angles / stories / ways to describe the product** on the given topic. These are NOT features and NOT distinct customer problems — they are *ways to talk about* what the product already does.

Topic: **$ARGUMENTS**
Input: `docs/usecase-lab/$ARGUMENTS/inventory.md`
Output: `docs/usecase-lab/$ARGUMENTS/ideas.md`

## Critical framing — angles, not features

A vibecoder with one product still needs **many ways to describe it**:
- One landing-page hero headline
- One LinkedIn announcement post
- Ten tweets, each a different hook
- Three blog posts, each a different narrative
- Five cold-email subject lines
- One investor-pitch tagline
- Comparison angles against each major competitor
- Migration/wedge stories for each incumbent
- Audience-specific framings (solo user, team, enterprise)

Each of those is a separate angle. Your job is to generate 30-60 of them from the product inventory — not 30-60 distinct products.

**Good angle (concrete, quotable, lands in under 10 words):**
- "Your meeting notes write themselves"
- "Import your Evernote in one click"
- "Notion, but for people who actually take notes"

**Bad angle (feature description, engineering framing, or vague marketing):**
- "AI summarization of long notes" (feature, not a hook)
- "Integrations with popular tools" (vague)
- "Synergistic workflow unlock" (marketing-speak)

When in doubt: **would this phrase work as a tweet, landing headline, or cold-email subject line?** If not, rewrite.

## Workflow

### 1. Read the inventory

Load `docs/usecase-lab/$ARGUMENTS/inventory.md`. If missing, tell the user to run `/usecase-explore $ARGUMENTS` first. Stop.

### 2. Generate 30-60 angles

Organize into 6-12 categories (types of content, not product segments — see templates below). For each angle, include:
- **Headline** (5-10 words — the quotable version)
- **Short description** (1-2 sentences on what's behind this angle, what it'd read like as a post/ad/hero)
- **Horizon**: `NOW` (backed by shipped capabilities) · `NEXT` (2-4 weeks away) · `FUTURE` (aspirational, roadmap-only)
- **Optional notes**: caveats, which inventory capability it's based on, risks

### 3. Aim for volume, not polish

Include:
- **Flagship hero angles** — the cleanest one-liner for your top capability
- **Comparison angles** — "X but without Y" vs. specific competitors
- **Audience wedges** — same capability framed for different users (solo, team, enterprise)
- **Viral hooks** — surprise, counterintuition, "oh shit" moments
- **Transformation demos** — before/after framing of what the product does
- **Integration stories** — angles built around each major integration
- **Migration wedges** — "switch from X in one click"
- **Trust signals** — "doesn't lock you in," "works offline," etc.
- **FUTURE angles** — what you could *describe* if you built the thing on the roadmap. Honestly marked FUTURE.

### 4. Be honest about horizons

If an angle relies on a capability that doesn't exist yet, mark `FUTURE` with a caveat in notes. No vaporware angles dressed as `NOW`. `FUTURE` angles still earn their place — they're candidates for a "what's next" section and for roadmap discussions.

### 5. Topic-specific category templates

Pick categories by **type of content** (landing hero, social post, etc.), not by product segment (mobile, enterprise). If topic matches a known shape, use these as seeds:

| Topic | Suggested categories |
|---|---|
| `landing-angles` | Hero headlines · Features grid lines · Subhead/sub-promise · Trust signals · Comparison section · "What-if" / Coming Soon |
| `marketing-stories` | Hero narratives · X threads · LinkedIn posts · Blog post titles · Demo scripts · Sales talking points |
| `viral-content` | Surprise/counterintuition hooks · Before/after transformations · Contrarian takes · Quotable one-liners · Comparison wins · Long-tail bug demos |
| `cold-email-hooks` | Subject lines · Opening lines · Value-prop lines · P.S. lines · Comparison lines · Follow-up hooks |
| `enterprise-pitch` | Compliance signals · Audit/RBAC lines · Sovereignty angles · SLA promises · Procurement de-risking · "Not a toy" proof points |
| `onboarding-flows` | First-5-min moments · Activation angles · Aha-flow copy · Friction-removal lines · Progressive disclosure steps |
| `developer-tools` | CLI one-liners · "Why not just X" comparisons · IDE integration angles · CI hook demos · Error-message polish · Docs-experience promises |
| `investor-pitch` | One-sentence taglines · Market-size framings · Moat angles · Unfair-advantage lines · "Why now" · "What breaks if you ignore this" |

If the topic doesn't match, propose 6-12 categories from first principles. The test: each category is a **type of place the angle will live** (homepage hero slot, tweet, subject line, slide title, section heading) — not a product area.

### 6. Write `ideas.md`

Structure:

```markdown
# Story Angles — <topic>

Generated 2026-XX-XX from `inventory.md`.

Product has one core use case: <one-sentence summary from inventory>. This file catalogs <N> different ways to *describe* what we built — each tagged by where it might live and how demo-ready it is.

## Category 1 — <type of content>

### 1. "<Headline>"

<1-2 sentences of what's behind this angle. What capability from the inventory does it lean on? Who would it resonate with? Where would it live?>

- **Horizon**: NOW
- **Notes**: <caveats or which inventory capability this is based on>

### 2. "<Headline>"

...
```

Use sequential numeric IDs across all categories (not per-category). IDs are referenced in `scored.csv` downstream.

### 7. Summary to user

- Total angles generated
- Count per category
- Any category that felt thin (might need more exploration of the inventory)
- Path to `ideas.md`
- Reminder: "These are angles, not features. Even if the product has one use case, you have many ways to sell it."

## Anti-patterns

- **Generating features instead of angles** ("Real-time collaboration" is a feature; "Real-time collab without the Google Docs bloat" is an angle). If you can't say it in quotes as a headline, it's not an angle.
- **Duplicate angles phrased differently** → merge into one.
- **Vague marketing-speak** ("synergy", "leverage", "unlock value", "seamless") → rewrite to be concrete, quotable.
- **Overselling** — claiming capabilities beyond the inventory. If no shipped capability backs the angle, mark FUTURE.
- **Categorizing by product area** (mobile / enterprise / AI features) instead of by content type (hero / tweet / blog). Wrong categories make prioritization mean the wrong thing.
- **Premature prioritization** — volume first. Scoring happens in `/usecase-score`.
