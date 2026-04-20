---
description: (Stub) Retrospective — find patterns across shipped vs killed ideas
argument-hint: <topic>
---

# Retrospective

**Status: not yet implemented.** This is a stub for the planned pipeline.

## Planned behavior

Analyzes `history.jsonl` and measured outcomes across all completed ideas. Reports:

- **Which framework criteria actually predicted success?** (Scoring calibration)
- **Which categories have the highest hit rate?** (Where to invest more)
- **Ideas marked `NOW` that shipped as `FUTURE`** — how often? (Calibration on shippability)
- **Ideas marked high virality that actually went viral** — hit rate
- **Ideas marked high revenue that actually monetized** — hit rate

## Requires first

- `/usecase-track` to mark ideas as planned / in-progress / shipped / killed
- `/usecase-measure` to record outcomes per shipped idea

## Current workaround

Review your `scored.csv` against what actually shipped and what worked:
- Did your `hero` preset top-5 become the things you actually featured?
- Did your `viral` preset top-5 get the most retweets?
- Where did the framework mispredict?

Write those notes into `docs/usecase-lab/<topic>/retro.md` manually.

## When this ships

Output will be `docs/usecase-lab/<topic>/retro-<date>.md` with:
- Calibration table per criterion
- Category hit-rate breakdown
- Recommendations to update framework weights

Next step in the chain: `/usecase-learn` — automatically adjusts weight profiles based on retro findings.

See https://github.com/dchekmarevv/usecase-lab/issues for status.
