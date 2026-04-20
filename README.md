# usecase-lab

> You built the product. Now pick the use cases that actually land.

Every founder and marketer hits this after shipping: your product has 60 possible use cases — hero demos, viral hooks, enterprise angles, integration stories — but your landing, LinkedIn, and X have room for 5. The 5 you pick don't just change your messaging; they tell you **where product and marketing should optimize next.**

`usecase-lab` is a Claude Code toolkit that turns your product into a scored, filterable, interactive prioritization page. It does two jobs:

1. **What goes on your landing today.** Score shipped use cases across 7 criteria; commit to the 5 that'll actually land — homepage hero, features section, LinkedIn posts, X threads.
2. **What goes in your "what-if" section.** Tag unbuilt use cases as `FUTURE`, score them under the `AI era` preset that rewards differentiation and virality. Spot the angles worth *building toward* — so roadmap and marketing argue from the same page instead of running on parallel tracks.

**You get:**
- A grounded inventory of what your product actually does (not what your pitch deck claims)
- 30–60 use case angles generated from that inventory, grouped by category, honestly horizon-tagged (NOW / NEXT / FUTURE)
- A scoring framework with 7 criteria and 7 opinionated weight presets (including the **AI era** preset that rewards virality and revenue over shippability)
- An interactive HTML page with live weight sliders, filters, top-5 cards, CSV export — no backend, no CDN, no build step

**Who this is for:**
- **Founders post-ship.** You know what you built; you need to decide which angle goes on the homepage and where to optimize next.
- **Marketers with too many options.** Every feature is a potential demo. Which 5 get the budget?
- **Teams aligning product and marketing.** The scoring page is the shared source of truth — "what if we built X" becomes a scored angle instead of a vibes argument.

## Quick start

1. Install (30 seconds — see below)
2. Run `/usecase-lab landing-angles` in your project
3. Watch it generate inventory → ideas → scoring → interactive HTML
4. Drag the weight sliders in the browser
5. Stop there. You'll know if this is for you.

## Install — 30 seconds

**Requirements:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code), `curl`, a project directory (any codebase — or an empty folder if you're starting from scratch).

From your project root:

```sh
curl -sSL https://raw.githubusercontent.com/dchekmarevv/usecase-lab/main/install.sh | sh
```

This drops eight slash commands into `.claude/commands/` and a renderer template into `.usecase-lab/templates/`. No dependencies. No `npm install`. No background daemon.

## See it work

Walking through a real session on a fictional note-taking product called "Acme Notes" (the example bundled in this repo):

```
You:    /usecase-lab landing-angles

Claude: Exploring your product...
        [reads README, package.json, docs/, recent commits, BACKLOG.md —
         returns a grounded inventory of what Acme Notes actually does today.]

        Inventoried 14 shipped capabilities, 6 integrations, 3 signature
        features (offline sync, AI summarization, bidirectional links).
        Flagged 4 roadmap items as FUTURE.

        Saved to inventory.md. Continue? [y/N]

You:    y

Claude: Brainstorming landing angles...
        [generates 28 positioning stories across 6 categories — not
         features, not roadmap items, but the ways you could *describe*
         what you built. Each tagged NOW / NEXT / FUTURE.]

        28 angles across: Hero demos (6), Comparison angles (5), Audience
        wedges (4), Viral hooks (4), Integration stories (3), What-if
        angles (6 — FUTURE).

        Saved to ideas.md. Continue? [y/N]

You:    y

Claude: Framework — default 7 criteria, 7 presets including AI era.

You:    Approve.

Claude: Scoring 28 angles...
        [applies rubrics honestly. FUTURE angles locked to shippability ≤ 2 —
         the framework refuses to dress aspirational pitches as demos.]

        Under Landing hero preset (weight today's shipped angles):
          #3  "Your meeting notes write themselves"            — 41
          #7  "Import your Evernote in one click"              — 39
          #11 "Works offline, syncs when you're back"          — 38
          #5  "Real-time collab without the Google Docs bloat" — 37
          #12 "Templates for every meeting type"               — 35

        Under AI era preset (reward angles worth building toward):
          #24 "Your notes become your task list automatically" — FUTURE · 48
          #7  "Your meeting notes write themselves"            —         44
          #26 "Your second brain, on your wrist"               — FUTURE · 42
          #18 "The note app that actually remembers"           —         41
          #9  "Brain-dump → organized in 15 seconds"           —         40

        Continue? [y/N]

You:    y

Claude: Rendered docs/usecase-lab/landing-angles/index.html.
        Opening in your browser.

[interactive page: 7 weight sliders, 7 preset buttons, Top-5 cards,
 sortable table, filter chips by horizon and category, CSV export.]
```

Two decisions fall out of the same page:

- **For your landing today →** commit to 3–5 from the Landing hero column. They're shippable, the ICP cares, they differentiate. Hero copy writes itself: #3 becomes the hero headline, #5/#7 become the features grid, #11 becomes the trust bullet.
- **For your "what-if" section →** angles #24 and #26. Both `FUTURE`, both score near the top under AI era. That's roadmap feeding marketing: ship those, and you unlock stories that actually cut through. Product and marketing arguing from the same page instead of parallel tracks.

Five commands, ~10 minutes. Same result in Notion + a spreadsheet is usually a week of doc churn — and still ends in an argument about whose intuition is right.

## The pipeline

usecase-lab is a process, not just a collection of commands. Each step writes an artifact the next step reads:

```
explore  →  brainstorm  →  framework  →  score  →  render
inventory.md   ideas.md    framework.json  scored.csv   index.html
```

Each artifact is plain text, diff-friendly, commit-friendly. Edit them by hand, re-run from any step, share on Slack, merge via PR. The interactive HTML is the dashboard you open in a browser; the markdown and CSV are the source of truth.

## Commands

| Command | Role | What it does | Artifact |
|---|---|---|---|
| `/usecase-explore <topic>` | **Researcher** | Dispatches an agent to inventory your product — shipped capabilities, integrations, roadmap, signature features, evidence gaps. Handles greenfield projects (asks for a description instead). | `inventory.md` |
| `/usecase-brainstorm <topic>` | **Idea Generator** | Turns the inventory into 30–60 grouped use cases with horizons (NOW / NEXT / FUTURE) and honest caveats about what's real vs aspirational. | `ideas.md` |
| `/usecase-framework <topic>` | **Scoring Designer** | Proposes the default 7-criterion framework + 7 weight presets. Lets you customize rubrics, add dimensions, or define your own presets. | `framework.md` + `framework.json` |
| `/usecase-score <topic>` | **Scorer** | Scores every idea 1–5 on every criterion using the rubrics. Refuses to inflate vaporware scores. Also computes all preset totals so the CSV works standalone. | `scored.csv` |
| `/usecase-render <topic>` | **Visualizer** | Substitutes scored data + framework into the HTML template and opens in your browser. No build step, no CDN, works from `file://`. | `index.html` |
| `/usecase-lab <topic>` | **Composite** | Runs the whole pipeline in sequence with a checkpoint after each step. Pass `--auto` to skip confirmations. | All of the above |

### Stubs (not yet implemented — see Vision)

| Command | Planned role | Status |
|---|---|---|
| `/usecase-track <id> <status>` | **Project Manager** — mark ideas as planned / in-progress / shipped / killed; link PR | Stub only |
| `/usecase-retro <topic>` | **Analyst** — pattern analysis across shipped vs killed ideas | Stub only |

## The framework

Every idea gets scored on 7 criteria (1–5 each):

| Criterion | Question | Rubric highlights |
|---|---|---|
| **Shippability** | Can we demo this today, without vaporware? | 1 = doesn't exist · 5 = demo-ready today |
| **ICP pain** | Does this target user actually care? | 1 = not their problem · 5 = acute pain |
| **Differentiation** | Different from alternatives they already have? | 1 = everyone has this · 5 = unique capability |
| **Virality** | Surprise + emotional hook + shareable? | 1 = boring · 5 = meme / "oh shit" moment |
| **Revenue** | Affects the purchase decision? | 1 = PR only · 2 = procurement gate · 3 = trial conversion · 4 = core paid value · 5 = ACV lever |
| **Channel breadth** | Works on tweet + landing + demo + onboarding? | 1 = one channel · 5 = packages everywhere |
| **Asset cost** | Cheap to produce? (inverted — 5 = cheap) | 1 = major product work · 5 = screenshot today |

**Total = weighted sum.** The weights are yours to set.

### Weight presets

| Preset | Philosophy | Weights |
|---|---|---|
| **Unweighted** | Trust the raw scores | all × 1 |
| **Landing hero** | Must work today, differentiate, and monetize | shipp × 2, diff × 2, rev × 2 |
| **Viral / demo** | Shareable story that actually works | shipp × 2, diff × 2, viral × 2 |
| **Sales deck** | What closes deals | rev × 3, icp × 2, diff × 2 |
| **ICP-first** | Everything through user pain | icp × 3, shipp × 2 |
| **NOW-bias** | Ship what we already have | shipp × 3, cost × 2 |
| **AI era** | Shipping is free. What matters is signal. | **diff × 3, viral × 3, rev × 3**, shipp × 0 |

> The **AI era** preset is the strong opinion in the box. When AI makes building cheap, `shippability` stops being a moat — everyone can ship. What still matters is whether your idea cuts through the noise (`differentiation`), spreads (`virality`), and earns money (`revenue`). Use it to filter for "what would still matter if building was free."

All presets are live-switchable in the rendered HTML. Drag a slider and the active preset deactivates — you're in custom-weights mode. Click a preset button to snap back.

### Horizons

- `NOW` — demoable today
- `NEXT` — 2–4 weeks of work
- `FUTURE` — aspirational, Phase 2+

Scoring honesty is enforced through horizons: if an idea is `FUTURE`, its `shippability` is locked to 1–2. No aspirational pitch dressed up as a demo.

## Philosophy

- **Honesty over optimism.** Vaporware stays vaporware. Future ideas are tagged `FUTURE`; the framework refuses to inflate them into today's roadmap.
- **Volume before polish.** 60 ideas you can filter beats 6 ideas you had to perfect before showing them.
- **Framework weights encode taste.** Arguing about weights is the productive argument. Arguing about whether idea X or Y is "better" is not.
- **Plain text, diff-friendly, commit-friendly.** The artifacts live in your repo. They survive your tool choices.
- **No backend.** No hosted service, no telemetry, no account. Your ideas stay in your repo.
- **The AI era preset is a statement.** When shipping is free, shipping stops being the differentiator. Tools that still act like it does are behind.

## Vision

**What ships today (v0.1):**

```
idea  →  scored  →  interactive explorer
 ✅        ✅              ✅
```

**What's planned:**

```
idea → scored → plan → ship → measure → retro → learn → re-score
 ✅      ✅      ❌     ❌       ❌        ❌       ❌       ❌
```

The goal is a full loop: **propose an idea → score it → write a plan → ship it → measure outcome → retro what worked → feed back into the framework → next round is smarter.** The scoring is the front door; the learning loop is the moat.

Planned commands for the loop:

| Command | What it adds |
|---|---|
| `/usecase-plan <id>` | Implementation plan for a specific idea (scope, effort estimate, success metric) |
| `/usecase-track <id> <status>` | Status updates + PR links; append to `history.jsonl` |
| `/usecase-measure <id>` | Record actual outcomes per shipped idea (impressions, signups, whatever you care about) |
| `/usecase-retro <topic>` | Which criteria actually predicted success? Where did the framework miscalibrate? |
| `/usecase-learn <topic>` | Automatically adjust weight presets based on retro findings. Closed loop. |

Issues tracked at https://github.com/dchekmarevv/usecase-lab/issues. Contributions welcome.

## Example

[`examples/acme-notes-feature-ideas/`](examples/acme-notes-feature-ideas/) is a synthetic walkthrough for a fictional note-taking product ("Acme Notes"). 20 use cases, 7 criteria, 7 presets including AI era. Illustrative output showing what a real session produces.

To regenerate the HTML from that example: copy `framework.json` and `scored.csv` into your own `docs/usecase-lab/<topic>/` folder, then run `/usecase-render <topic>`.

## FAQ

**Do I need to be technical?**
No. You need [Claude Code](https://claude.com/claude-code) installed and a folder. The commands handle everything else. You'll look at markdown and CSV files produced for you; you don't write them.

**What if my project doesn't have code yet?**
`/usecase-explore` detects greenfield and asks you to describe the product in 3–5 sentences. The pipeline works from the description.

**Can I change the framework?**
Yes. `/usecase-framework` supports adding/removing criteria, rewriting rubrics, and defining custom weight presets. The HTML renders from `framework.json` — any change there shows up in the page.

**Does this send data anywhere?**
No backend. No telemetry. No account. Everything runs locally via Claude Code. The rendered HTML has no external fonts, no CDN, no analytics. File-based, commit-friendly.

**Can I share the HTML?**
It's a single self-contained file. Email it, drop it in Notion, serve it from a bucket, embed it via iframe. No dependencies to chase.

**Can I score things other than product use cases?**
Yes. The framework is product-agnostic. `/usecase-lab feature-ideas`, `/usecase-lab onboarding-flows`, `/usecase-lab enterprise-features` — anything you'd normally prioritize in a spreadsheet. Topic-specific category templates are in `/usecase-brainstorm` for common topics; anything else, it figures out from first principles.

**How do I update?**
Re-run the install script. It overwrites the commands and template in place.

**Can I contribute?**
Alpha status — rough edges welcome. Issues and PRs at https://github.com/dchekmarevv/usecase-lab.

## Roadmap

| Version | What | Status |
|---|---|---|
| **0.1.0** | Initial release — explore / brainstorm / framework / score / render / lab commands + HTML | ✅ Shipped 2026-04-20 |
| **0.2.0** | `/usecase-plan` — implementation plans per idea | Planned |
| **0.3.0** | `/usecase-track` + `/usecase-measure` — status + outcome data | Planned |
| **0.4.0** | `/usecase-retro` — pattern analysis across shipped ideas | Planned |
| **0.5.0** | `/usecase-learn` — auto-calibrate framework weights from retro | Planned |

## Prior art and thanks

- [gstack](https://github.com/garrytan/gstack) — the "Claude Code as a virtual team" pattern.
- [superpowers](https://github.com/obra/superpowers) — skills-as-methodology over skills-as-tools.

Both READMEs inspired this one; any rough edges here are mine.

## License

MIT. Free forever.

Fork it, rewrite the framework, ship your version. If you do, open an issue and I'll link to it.
