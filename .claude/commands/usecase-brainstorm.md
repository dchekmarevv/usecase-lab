---
description: Generate 30-60 use case ideas grouped by category, based on the product inventory
argument-hint: <topic-slug>
---

# Brainstorm Use Cases

Generate a broad volume of use cases for the current product on the given topic.

Topic: **$ARGUMENTS**
Input: `docs/usecase-lab/$ARGUMENTS/inventory.md`
Output: `docs/usecase-lab/$ARGUMENTS/ideas.md`

## Workflow

### 1. Read the inventory

Load `docs/usecase-lab/$ARGUMENTS/inventory.md`. If missing, tell the user to run `/usecase-explore $ARGUMENTS` first. Stop.

### 2. Generate 30-60 ideas

Organize into 6-12 categories. For each idea, include:
- **Short name** (5-10 words)
- **Description** (1-2 sentences)
- **Horizon**: `NOW` (demoable today) · `NEXT` (2-4 weeks) · `FUTURE` (aspirational)
- **Optional notes**: caveats, what's missing, risks

### 3. Aim for volume, not polish

Include:
- **Obvious / table-stakes** ideas (for completeness)
- **Signature / differentiating** ideas (from inventory's signature section)
- **Against-incumbent** angles ("X but without Y")
- **Emotional / viral** ideas (surprise, "oh shit" moments)
- **Roadmap-anchored** ideas (honestly marked NEXT/FUTURE)

### 4. Be honest about horizons

If an idea relies on code that doesn't exist, mark it `FUTURE` with a caveat in notes. No vaporware dressed as `NOW`.

### 5. Topic-specific templates

If the topic matches a known shape, use these as seeds:

| Topic | Suggested categories |
|---|---|
| `marketing-stories` | Hero narratives · Twitter threads · Demo videos · Sales talking points · Positioning angles |
| `onboarding-flows` | First-5-min moments · Activation goals · Aha flows · Friction points · Progressive disclosure |
| `viral-content` | Surprise bugs · Before/after stories · Contrarian takes · Benchmarks · Comparisons |
| `enterprise-features` | Compliance · Audit · RBAC · Sovereignty · SLAs · Procurement gates |
| `developer-tools` | CLI patterns · IDE integration · CI hooks · Error messages · Docs experience |
| `retention` | Week-2 hooks · Habit loops · Notification strategy · Re-engagement triggers |

If the topic doesn't match, propose 6-12 categories from first principles based on the inventory.

### 6. Write `ideas.md`

Structure:

```markdown
# Use Case Ideas — <topic>

Generated 2026-XX-XX from `inventory.md`.

## Category 1 — <name>

### 1. <short name>

<description>

- **Horizon**: NOW
- **Notes**: <caveats>

### 2. ...
```

Use sequential numeric IDs across all categories (not per-category). IDs are referenced in `scored.csv`.

### 7. Summary to user

- Count of ideas total
- Count per category
- Any category that felt thin (might need more exploration)
- Path to `ideas.md`

## Anti-patterns

- **Duplicate ideas phrased differently** → merge
- **Vague marketing-speak** ("synergy", "leverage", "unlock value") → concrete
- **Overselling** (claiming capabilities beyond inventory) → demote to FUTURE
- **Premature prioritization** → volume first, scoring later
