# Example: Acme Notes — feature ideas

A synthetic walkthrough for a fictional note-taking SaaS called "Acme Notes". The product and use cases here are invented for illustrative purposes only; any resemblance to a real product is coincidental.

## Files in this folder

| File | What it is |
|---|---|
| `framework.json` | 7 criteria (Shippability, ICP pain, Differentiation, Virality, Revenue, Channel breadth, Asset cost) + 7 weight profiles including `ai-era` |
| `scored.csv` | 20 use cases scored across 7 criteria |
| `index.html` | (regenerate with `/usecase-render`) — interactive page with live weight sliders |

## Regenerate the HTML locally

Copy `scored.csv` and `framework.json` into your own `docs/usecase-lab/<topic>/` folder, then run:

```
/usecase-render <topic>
```

## Key takeaways from this example

**Top 5 by unweighted total:**
1. Real-time collaboration (29)
2. AI summarization on long notes (28)
3. Offline-first sync (28)
4. Templates gallery (27)
5. Import from Evernote (26)

**Top 5 under `ai-era` preset** (shipp=0, diff×3, viral×3, rev×3):
1. AI summarization on long notes
2. Voice-to-text meeting capture
3. Real-time collaboration
4. "Brain-dump → organized" demo
5. AI task extraction from notes (FUTURE — high upside despite shippability=1)

Under `ai-era`, AI-powered features and shareable demos float up. Under `landing hero`, shipped-today features win.

## Context

This is intentionally fictional. The synthetic product ("Acme Notes") is a minimal stand-in so you can see what a real session output looks like without me having to include real customer data. Use it as a template for your own topic; do not use these specific use cases or scores as reference for your own product.
