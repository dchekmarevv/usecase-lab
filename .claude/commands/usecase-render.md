---
description: Render the interactive HTML scoring page with live weight sliders
argument-hint: <topic-slug>
---

# Render Interactive Page

Turn scored CSV + framework JSON into a self-contained interactive HTML.

Topic: **$ARGUMENTS**
Inputs:
- `docs/usecase-lab/$ARGUMENTS/scored.csv`
- `docs/usecase-lab/$ARGUMENTS/framework.json`
- `.usecase-lab/templates/renderer.html.template`

Output: `docs/usecase-lab/$ARGUMENTS/index.html`

## Workflow

### 1. Read template

Load `.usecase-lab/templates/renderer.html.template`. If missing, tell user to re-run installer:

```sh
curl -sSL https://raw.githubusercontent.com/dchekmarevv/usecase-lab/main/install.sh | sh
```

### 2. Parse inputs

- `scored.csv` → JSON array of idea objects, each with all criteria scores + horizon + notes
- `framework.json` → criteria definitions + presets + horizons

### 3. Substitute placeholders

Replace in the template:

| Placeholder | Value |
|---|---|
| `{{TITLE}}` | Prettified topic (e.g., `marketing-stories` → "Marketing Stories") |
| `{{DATE}}` | Today's date, `YYYY-MM-DD` |
| `{{COUNT}}` | Number of ideas |
| `{{USE_CASES_JSON}}` | JSON array of scored ideas |
| `{{CRITERIA_JSON}}` | JSON array from `framework.json` criteria |
| `{{PRESETS_JSON}}` | JSON object from `framework.json` presets |

JSON must be valid embedded in JS — use `JSON.stringify(obj)`-style output. Preserve UTF-8. Escape `</script>` if it appears in any string (replace with `<\/script>` to prevent breaking the tag).

### 4. Write `index.html`

Save to `docs/usecase-lab/$ARGUMENTS/index.html`.

### 5. Open in browser

Detect platform and launch:
- macOS: `open <path>`
- Linux: `xdg-open <path>`
- WSL: `explorer.exe <path>`
- Windows native: `start <path>`

If you can't detect platform, just tell the user the path.

### 6. Summary to user

Brief: "Rendered to `<path>`. N ideas. Opens in browser."
Also show top 3 under current `unweighted` total, and top 3 under `ai-era` if present (often different).

## Notes

- The template is self-contained (no CDN, no external fonts, no build step). Works from `file://`.
- Users can edit the `.usecase-lab/templates/renderer.html.template` if they want custom styling. Re-running `/usecase-render` will use the custom template.
- Don't pretty-print the JSON output — compact JSON keeps the HTML file smaller and cleaner.

## Anti-patterns

- **Don't forget to escape** `</script>` in data. One tag in a description breaks the whole page.
- **Don't hardcode 7 criteria.** Template must adapt to however many criteria are in `framework.json`.
- **Don't add external dependencies** (fonts, CDN, analytics).
