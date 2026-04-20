---
description: Inventory product capabilities, roadmap, and signature features for use-case brainstorming
argument-hint: <topic-slug>
---

# Product Inventory

Inventory what this product does today — so downstream brainstorming is grounded in reality, not hallucination.

Topic: **$ARGUMENTS**
Output: `docs/usecase-lab/$ARGUMENTS/inventory.md`

## Workflow

### 1. Ensure output directory exists

Create `docs/usecase-lab/$ARGUMENTS/` if missing.

### 2. Detect context

Look for signals of what this product is:
- Codebase roots: `README.md`, `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `src/`, `app/`, `lib/`
- Product docs: `docs/`, `docs/internal/*.md`, `PRODUCT.md`, `VISION.md`
- Backlog / roadmap: `BACKLOG.md`, `ROADMAP.md`, `docs/**/*backlog*.md`, `docs/**/*roadmap*.md`
- Recent activity: `git log --oneline -50`
- Strategy docs: anything with `strategy`, `milestones`, `product-concept`, `plans` in the name

### 3. If no codebase exists (greenfield)

Ask the user:

> "I don't see a codebase yet. Describe the product in a few sentences:
> - What does it do?
> - Who's the user?
> - What's the current stage? (idea / prototype / MVP / shipped)"

Wait for their answer. Treat it as the inventory source.

### 4. If codebase exists — dispatch an Explore agent

Dispatch a subagent (preferably the `Explore` agent at thoroughness `medium` or `very thorough`) with this brief:

> Do a thorough inventory of what this product does. Report in these sections:
>
> - **CAPABILITIES (shipped today, verified in code)**: grouped bullets by domain. Be specific — cite file paths. No vague marketing-speak.
> - **INTEGRATIONS / EXTERNAL DEPENDENCIES**: three columns — shipped vs mocked vs roadmap. What's actually wired up?
> - **IN-PROGRESS / NEAR-TERM**: from backlog, recent commits, open TODOs. Include ticket/commit refs.
> - **ASPIRATIONAL / LONG-TERM**: from strategy docs, vision files, RFCs. What's designed but not built?
> - **SIGNATURE / DIFFERENTIATING CAPABILITIES**: things that stand out vs typical tools in this space. The "why this product" angle.
> - **EVIDENCE GAPS**: things mentioned in docs/roadmap but not found in code. Things I can't verify.
>
> Report ~600-1000 words, organized. Specificity over breadth.

### 5. Write the inventory

Save to `docs/usecase-lab/$ARGUMENTS/inventory.md` with clear `## Section` headings. Include a top-line summary of 2-3 sentences.

If you used the agent, paste their full report (cleanly formatted) as the body.

### 6. Summary to user

2-3 sentences: "Inventoried N capabilities, M integrations. Signature features: X, Y, Z. Evidence gaps: ... . Saved to `<path>`."

## Anti-patterns

- **Don't hallucinate capabilities**. If the agent reports gaps, preserve them.
- **Don't paraphrase** the agent's specific findings into vague bullets.
- **Don't lecture** the user on what they built — they know.
- **Don't repeat across re-runs** — overwrite cleanly. No merging.
