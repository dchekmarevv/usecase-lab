---
description: Define scoring criteria interactively (good defaults provided)
argument-hint: <topic-slug>
---

# Define Scoring Framework

Propose a scoring framework, let the user adjust, save it.

Topic: **$ARGUMENTS**
Output: `docs/usecase-lab/$ARGUMENTS/framework.md`

## Default framework — 7 criteria, 1-5 each

| # | Criterion | Question | Rubric |
|---|---|---|---|
| 1 | **Shippability** | Can we demo this today, without vaporware? | 1 = doesn't exist · 3 = needs setup · 5 = demo-ready today |
| 2 | **ICP pain** | Does this target user actually care? | 1 = not their problem · 3 = mild annoyance · 5 = acute pain |
| 3 | **Differentiation** | Different from alternatives they already have? | 1 = everyone has this · 3 = nuanced diff · 5 = unique capability |
| 4 | **Virality** | Surprise + emotional hook + shareable? | 1 = boring · 3 = clean story arc · 5 = meme / "oh shit" |
| 5 | **Revenue** | Affects the purchase decision? | 1 = PR only · 2 = procurement gate · 3 = trial conversion · 4 = core paid value · 5 = ACV lever |
| 6 | **Channel breadth** | Works on tweet + landing + demo + onboarding? | 1 = one channel · 3 = 2-3 channels · 5 = works everywhere |
| 7 | **Asset cost** | Cheap to produce? (inverted — 5 = cheap) | 1 = major product work · 3 = day-two setup · 5 = screenshot today |

## Default weight profiles

| Name | Philosophy | Weights |
|---|---|---|
| `unweighted` | Equal weight on everything | all × 1 |
| `hero` (Landing hero) | Must work today + differentiate + monetize | shipp×2, diff×2, rev×2, rest×1 |
| `viral` (Viral / demo) | Shareable story that actually works | shipp×2, diff×2, virality×2, rest×1 |
| `sales` (Sales deck) | What closes deals | revenue×3, icp×2, diff×2, rest×1 |
| `icp` (ICP-first) | Everything through user pain | icp×3, shipp×2, rest×1 |
| `now-bias` (NOW-bias) | Ship-what-we-have mode | shipp×3, cost×2, rest×1 |
| `ai-era` (AI era) | Shipping is free; diff + virality + revenue are what matters | diff×3, virality×3, rev×3, icp×1, breadth×1, cost×1, shipp×0 |

The **AI era** preset encodes a strong opinion: in an era where AI can build anything fast, `shippability` stops being a differentiator. What matters is whether your idea cuts through the noise (`differentiation`), spreads (`virality`), and earns money (`revenue`). Use it when you want to filter for "what would still matter if shipping was free".

## Horizons

- `NOW` — demoable today
- `NEXT` — 2-4 weeks of work
- `FUTURE` — Phase 2+ / aspirational

## Workflow

### 1. Show defaults

Show the default framework concisely (table form). Say something like:

> "Here's the default framework. Seven criteria, 1-5 each. Seven weight profiles including 'AI era' (rewards differentiation + virality + revenue, ignores shippability). Use as-is, or adjust?"

### 2. Ask how to adjust

Options:
- `a` — use as-is, save and exit
- `b` — add or remove criteria
- `c` — change rubrics
- `d` — change or add weight profiles
- `e` — change horizons

Iterate until user approves. Keep changes minimal — don't redesign unless asked.

### 3. Write `framework.md`

Full markdown document with:
- List of criteria (with key, label, short name, question, rubric)
- All weight profiles (with explanation for each)
- Horizon definitions
- Any user notes / rationale for customizations

### 4. Also emit JSON

Alongside `framework.md`, write `framework.json` with the machine-readable structure:

```json
{
  "criteria": [
    {
      "key": "shipp",
      "label": "Shippability",
      "short": "Shipp",
      "question": "Can we demo this today, without vaporware?",
      "rubric": [
        ["1", "doesn't exist in code"],
        ["3", "works but needs setup"],
        ["5", "demo-ready today"]
      ]
    }
  ],
  "presets": {
    "unweighted": { "label": "Unweighted", "weights": { "shipp": 1, ... } },
    "ai-era": { "label": "AI era", "weights": { "shipp": 0, "icp": 1, "diff": 3, "viral": 3, "rev": 3, "breadth": 1, "cost": 1 } }
  },
  "horizons": [
    { "key": "NOW", "label": "NOW", "desc": "demoable today" },
    { "key": "NEXT", "label": "NEXT", "desc": "2-4 weeks" },
    { "key": "FUTURE", "label": "FUTURE", "desc": "aspirational" }
  ]
}
```

This JSON is consumed by `/usecase-render`.

### 5. Summary to user

"Framework saved with N criteria and M weight profiles. Key paths: `framework.md`, `framework.json`."

## Anti-patterns

- **Don't bikeshed** — defaults are good. Only adjust when user asks.
- **Don't lose AI era** — it's the strongest opinion in the defaults. Keep it unless explicitly removed.
- **Don't drop rubrics** — they're what keep scoring honest.
