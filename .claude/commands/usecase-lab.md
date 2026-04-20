---
description: Full use-case prioritization pipeline — explore → brainstorm → framework → score → render
argument-hint: <topic-slug> [--auto]
---

# Use Case Lab — Full Pipeline

Run the end-to-end usecase-lab pipeline for the user.

Arguments: **$ARGUMENTS**

## If no topic given

If `$ARGUMENTS` is empty or just `--auto`, ask the user:

> "What topic? Examples: `marketing-stories`, `onboarding-flows`, `viral-content`, `enterprise-features`, `developer-tools`."

Wait for their answer, then proceed with that as the topic.

## Directory layout

All artifacts go into `docs/usecase-lab/<topic-slug>/`:

```
inventory.md    # from /usecase-explore
ideas.md        # from /usecase-brainstorm
framework.md    # from /usecase-framework
scored.csv      # from /usecase-score
index.html      # from /usecase-render
```

Ensure this directory exists before starting.

## Execution

Run each step in order. After each step:
- Show a compact summary (2-3 sentences, top highlights)
- Ask "Continue?" before starting the next step

**Unless** `--auto` was passed in `$ARGUMENTS` — then run straight through without pausing.

### Step 1 — Explore product

Read `.claude/commands/usecase-explore.md` and follow its instructions with the topic.

### Step 2 — Brainstorm ideas

Read `.claude/commands/usecase-brainstorm.md` and follow its instructions.

### Step 3 — Define framework

Read `.claude/commands/usecase-framework.md` and follow its instructions.

### Step 4 — Score ideas

Read `.claude/commands/usecase-score.md` and follow its instructions.

### Step 5 — Render interactive page

Read `.claude/commands/usecase-render.md` and follow its instructions. Then run `open <path-to-html>` (macOS) or `xdg-open` (Linux) to launch it.

## Audience

The user is non-technical (vibecoder). Keep language plain. Avoid jargon. Show progress clearly. Don't lecture.

## Final summary

When everything is done, tell the user:
- Path to the generated folder
- How many ideas were generated
- Top 3 by unweighted total (names + total scores)
- One suggested next action: adjust weights in the HTML, re-run a step to iterate, or share the folder

## Quality gates

Refuse to proceed past a step if the prior step's artifact is missing or empty. Tell the user what's missing and how to fix (usually: re-run the prior step).
