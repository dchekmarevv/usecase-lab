#!/bin/sh
# usecase-lab installer
# Usage:
#   curl -sSL https://raw.githubusercontent.com/dchekmarevv/usecase-lab/main/install.sh | sh
#   curl -sSL https://raw.githubusercontent.com/dchekmarevv/usecase-lab/main/install.sh | sh -s -- /path/to/project

set -e

REPO="dchekmarevv/usecase-lab"
BRANCH="${USECASE_LAB_BRANCH:-main}"
RAW="https://raw.githubusercontent.com/$REPO/$BRANCH"

TARGET="${1:-$PWD}"

# Safety: refuse to install into root
if [ "$TARGET" = "/" ]; then
  echo "✗ Refusing to install into /. Run from your project directory." >&2
  exit 1
fi

if [ ! -d "$TARGET" ]; then
  echo "✗ Target directory does not exist: $TARGET" >&2
  exit 1
fi

COMMANDS_DIR="$TARGET/.claude/commands"
TEMPLATES_DIR="$TARGET/.usecase-lab/templates"

echo "Installing usecase-lab into $TARGET"
echo ""

mkdir -p "$COMMANDS_DIR" "$TEMPLATES_DIR"

COMMANDS="usecase-lab usecase-explore usecase-brainstorm usecase-framework usecase-score usecase-render usecase-track usecase-retro"

for cmd in $COMMANDS; do
  echo "  • .claude/commands/$cmd.md"
  curl -fsSL "$RAW/.claude/commands/$cmd.md" -o "$COMMANDS_DIR/$cmd.md"
done

echo "  • .usecase-lab/templates/renderer.html.template"
curl -fsSL "$RAW/templates/renderer.html.template" -o "$TEMPLATES_DIR/renderer.html.template"

cat <<EOF

✓ usecase-lab installed

Try it:

  $ claude
  > /usecase-lab marketing-stories

Or run steps individually:

  /usecase-explore <topic>
  /usecase-brainstorm <topic>
  /usecase-framework <topic>
  /usecase-score <topic>
  /usecase-render <topic>

Docs: https://github.com/$REPO

EOF
