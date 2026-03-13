#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# GEO-SEO Claude Code Skill Uninstaller
# ============================================================

CLAUDE_DIR="${HOME}/.claude"
SKILLS_DIR="${CLAUDE_DIR}/skills"
AGENTS_DIR="${CLAUDE_DIR}/agents"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Detect if running non-interactively (piped input)
INTERACTIVE=true
if [ ! -t 0 ]; then
    INTERACTIVE=false
fi

echo ""
echo -e "${YELLOW}GEO-SEO Claude Code Skill Uninstaller${NC}"
echo ""
echo "This will remove the following:"
echo ""

# List what will be removed
[ -d "$SKILLS_DIR/geo" ] && echo "  → ${SKILLS_DIR}/geo/"

for skill_dir in "$SKILLS_DIR"/geo-*/; do
    [ -d "$skill_dir" ] && echo "  → ${skill_dir}"
done

for agent_file in "$AGENTS_DIR"/geo-*.md; do
    [ -f "$agent_file" ] && echo "  → ${agent_file}"
done

echo ""

# Require explicit confirmation — abort in non-interactive mode
if [ "$INTERACTIVE" = false ]; then
    echo -e "${RED}✗ Uninstall requires interactive confirmation. Run this script directly (not piped).${NC}"
    exit 1
fi

read -p "Are you sure you want to uninstall? (y/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstall cancelled."
    exit 0
fi

echo ""

REMOVED=0

# Remove main skill
if [ -d "$SKILLS_DIR/geo" ]; then
    rm -rf "$SKILLS_DIR/geo"
    echo -e "${GREEN}✓ Removed main skill${NC}"
    REMOVED=$((REMOVED + 1))
fi

# Remove sub-skills
for skill_dir in "$SKILLS_DIR"/geo-*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        rm -rf "$skill_dir"
        echo -e "${GREEN}✓ Removed ${skill_name}${NC}"
        REMOVED=$((REMOVED + 1))
    fi
done

# Remove agents
for agent_file in "$AGENTS_DIR"/geo-*.md; do
    if [ -f "$agent_file" ]; then
        agent_name=$(basename "$agent_file")
        rm -f "$agent_file"
        echo -e "${GREEN}✓ Removed ${agent_name}${NC}"
        REMOVED=$((REMOVED + 1))
    fi
done

echo ""

if [ "$REMOVED" -eq 0 ]; then
    echo -e "${YELLOW}⚠ Nothing found to remove. GEO-SEO may not have been installed.${NC}"
else
    echo -e "${GREEN}GEO-SEO skill has been uninstalled (${REMOVED} items removed).${NC}"
fi

echo ""
echo "Note: Python dependencies were not removed."
echo "To remove them manually:"
echo "  pip uninstall beautifulsoup4 requests lxml reportlab"
echo ""
