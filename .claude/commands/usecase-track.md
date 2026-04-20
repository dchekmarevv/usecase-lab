---
description: (Stub) Track status of an idea — planned / in-progress / shipped / killed
argument-hint: <topic> <idea-id> [status]
---

# Track Idea Status

**Status: not yet implemented.** This is a stub for the planned pipeline.

## Planned behavior

```
/usecase-track marketing-stories 23 planned
/usecase-track marketing-stories 23 in-progress --pr https://github.com/user/repo/pull/42
/usecase-track marketing-stories 23 shipped --pr https://... --date 2026-05-01
/usecase-track marketing-stories 23 killed --reason "tried, no demand signal"
```

Will:
- Update `scored.csv` with `status`, `status_updated_at`, `pr_url` columns
- Append a line to `history.jsonl` (one state change per line)
- Link to PRs / issues / commits

## Current workaround

Until shipped, you can:

1. Add a `status` column to `scored.csv` manually
2. Keep a separate `tracking.md` alongside:
   ```
   # Tracking — marketing-stories
   - #4 Cross-signal correlation — planned (2026-04-20)
   - #23 Product catalog SKU demo — shipped (2026-04-25) — PR #42
   - #47 Code-level fix — deferred (Phase 2)
   ```

## When this ships

Follow-ups for the vision: `/usecase-measure` (record outcome metrics), `/usecase-retro` (find patterns), `/usecase-learn` (feed learnings back into framework).

See issue tracker at https://github.com/dchekmarevv/usecase-lab/issues for status.
