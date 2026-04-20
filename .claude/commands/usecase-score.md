---
description: Score every idea against the framework criteria
argument-hint: <topic-slug>
---

# Score Ideas

Score every idea against every criterion, honestly.

Topic: **$ARGUMENTS**
Inputs: `docs/usecase-lab/$ARGUMENTS/ideas.md`, `docs/usecase-lab/$ARGUMENTS/framework.json`
Output: `docs/usecase-lab/$ARGUMENTS/scored.csv`

## Workflow

### 1. Load inputs

- Read `ideas.md` — parse ideas (id, name, description, horizon, notes, category)
- Read `framework.json` — criteria definitions + presets
- If either missing, tell user to run the preceding step. Stop.

### 2. Score each idea

For each idea, score 1-5 on each criterion using the rubrics.

**Scoring honestly is critical.** Apply these rules:

- If horizon is `FUTURE`, `shippability` must be 1-2. Don't inflate.
- If an idea is table-stakes (any competitor has it), `differentiation` must be 1-2.
- If an idea relies on code that doesn't exist, flag in notes.
- Don't cluster all scores at 3-4. Use the full 1-5 range when warranted.
- If genuinely unsure, ask the user for calibration before guessing.

### 3. Compute preset totals

For every preset in `framework.json`, compute the weighted total per idea. This makes the CSV useful even without opening the HTML.

### 4. Write `scored.csv`

Columns, in this order:

```
id,category,name,description,horizon,<criteria_keys>,notes,<preset_totals>
```

Where:
- `<criteria_keys>` = one column per criterion (e.g. `shipp`, `icp`, `diff`, `viral`, `rev`, `breadth`, `cost`)
- `<preset_totals>` = one column per preset (e.g. `total_unweighted`, `total_hero`, `total_ai_era`)

Quoting rules:
- Fields with commas or quotes: wrap in double quotes, escape inner quotes by doubling (`""`)
- Numbers: no quotes
- Preserve UTF-8

### 5. Sort

Sort CSV by `total_unweighted` descending (primary), `id` ascending (secondary).

### 6. Preserve IDs across re-runs

If `scored.csv` already exists:
- Keep existing IDs for ideas that still appear in `ideas.md`
- Assign next-free IDs to new ideas
- Drop rows for deleted ideas (don't preserve orphans)

### 7. Summary to user

Report:
- Total ideas scored
- Top 5 by unweighted total (id, name, score)
- Top 3 by `ai-era` preset (if it exists) — often different picks
- Count of `shippability=1` items (honesty check — these are aspirational)
- Counts by horizon
- Path to `scored.csv`

## Anti-patterns

- **Don't invent scores.** If you can't judge without more context, ask.
- **Don't round up optimistically.** Vaporware stays vaporware.
- **Don't avoid 1s and 5s.** Using only 3 and 4 makes the framework useless.
- **Don't skip the preset totals.** They're what makes the CSV usable standalone.
