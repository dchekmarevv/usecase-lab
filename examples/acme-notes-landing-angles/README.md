# Example: Acme Notes — landing angles

A synthetic walkthrough for a fictional note-taking SaaS called "Acme Notes". The product and angles here are invented for illustrative purposes only; any resemblance to a real product is coincidental.

## The framing

Acme Notes has **one product** that solves **one core use case** (capture and organize personal / meeting notes). But the team has to answer: which story goes on the landing page? Which becomes the first blog post? Which tweet lands hardest? Which angle is worth building *toward*?

This example catalogs **28 different angles** for describing the same product — each a candidate for a specific channel (hero, tweet, blog title, cold email). That's what `usecase-lab` produces for any product: not a feature list, but a priority-ranked list of *ways to tell the story*.

## Files in this folder

| File | What it is |
|---|---|
| `framework.json` | 7 criteria (Shippability, ICP pain, Differentiation, Virality, Revenue, Channel breadth, Asset cost) + 7 weight profiles including `ai-era` |
| `scored.csv` | 28 story angles scored across 7 criteria, grouped by content type (Hero headlines, Migration wedges, Trust signals, Comparison angles, Audience wedges, Integration stories, Transformation demos, What-if / Coming Soon, Enterprise pitch) |
| `index.html` | (regenerate with `/usecase-render`) — interactive page with live weight sliders |

## Regenerate the HTML locally

Copy `scored.csv` and `framework.json` into your own `docs/usecase-lab/<topic>/` folder, then run:

```
/usecase-render <topic>
```

## Key takeaways from this example

**Top 5 by unweighted total — candidates for landing today:**
1. `#3` "Your meeting notes write themselves" — 29 · Hero headlines
2. `#1` "Stop losing ideas between three apps" — 28 · Hero headlines
3. `#5` "Import your Evernote in one click" — 27 · Migration wedges
4. `#24` "Your notes become your task list automatically" (FUTURE) — 27 · What-if
5. `#11` "Works offline, syncs when you're back" — 26 · Trust signals

**Top under `ai-era` preset** (shipp=0, diff×3, viral×3, rev×3) — candidates for a "what-if" / "coming soon" section:
1. `#24` "Your notes become your task list automatically" (FUTURE)
2. `#28` "Your meeting happens. Your notes exist." (FUTURE)
3. `#3` "Your meeting notes write themselves"
4. `#26` "Your second brain, on your wrist" (FUTURE)
5. `#9` "Brain-dump → organized in 15 seconds"

## What the two views tell you

- **For the landing page today** → lean on `#3`, `#1`, `#5`, `#11`, and the transformation demo `#9`. They're shipped, ICP-acute, and differentiated enough to own a homepage section.
- **For the "what-if" section** (and roadmap decisions) → `#24`, `#28`, and `#26` cluster at the top of AI era despite being unbuilt. That's a signal: if you ship those, you unlock stories that actually cut through. Product and marketing have a shared prioritization page instead of an argument.

## Why these are angles, not features

"Real-time collaboration" is a feature. `#7` "Real-time collab without the Google Docs bloat" is an angle — a specific, quotable, positioned-against-something way of describing the same capability. Every row in the CSV is quotable. That's the bar: **if you couldn't put it in quotes as a landing headline, tweet, or cold-email subject line, it's not an angle.**

## Context

This is intentionally fictional. The synthetic product ("Acme Notes") is a minimal stand-in so you can see what a real session output looks like. Use it as a template for your own topic; do not use these specific angles or scores as reference for your own product.
