#!/bin/bash

# Script to change ZSH theme to a new theme (works with any existing theme)
# Usage: ./change_theme.sh [new_theme_name]

# Default new theme (change this to your preferred theme)
NEW_THEME="daveverwer"

# If argument provided, use it as the new theme
if [ $# -eq 1 ]; then
    NEW_THEME="$1"
fi

# Path to .zshrc file
ZSHRC_FILE="$HOME/.zshrc"

# Check if .zshrc exists
if [ ! -f "$ZSHRC_FILE" ]; then
    echo "Error: .zshrc file not found at $ZSHRC_FILE"
    exit 1
fi

# Create backup
BACKUP_FILE="$ZSHRC_FILE.backup.$(date +%Y%m%d_%H%M%S)"
cp "$ZSHRC_FILE" "$BACKUP_FILE"
echo "Backup created: $BACKUP_FILE"

# Check if ZSH_THEME line exists
if grep -q "^[[:space:]]*ZSH_THEME=" "$ZSHRC_FILE"; then
    # Get current theme
    CURRENT_THEME=$(grep "^[[:space:]]*ZSH_THEME=" "$ZSHRC_FILE" | head -1 | sed 's/.*ZSH_THEME="\([^"]*\)".*/\1/')
    echo "Current theme: $CURRENT_THEME"

    # Replace existing ZSH_THEME line
    sed -i.tmp 's/^[[:space:]]*ZSH_THEME=.*$/ZSH_THEME="'"$NEW_THEME"'"/' "$ZSHRC_FILE"
    rm "$ZSHRC_FILE.tmp" 2>/dev/null || true

    echo "✅ Changed theme from '$CURRENT_THEME' to '$NEW_THEME'"
else
    # No ZSH_THEME line found, add it
    echo "No ZSH_THEME line found. Adding new theme line..."

    # Try to add after Oh My Zsh path if it exists
    if grep -q "^[[:space:]]*export ZSH=" "$ZSHRC_FILE"; then
        sed -i.tmp '/^[[:space:]]*export ZSH=/a\
ZSH_THEME="'"$NEW_THEME"'"' "$ZSHRC_FILE"
    else
        # Add at the beginning of the file
        sed -i.tmp '1i\
ZSH_THEME="'"$NEW_THEME"'"' "$ZSHRC_FILE"
    fi
    rm "$ZSHRC_FILE.tmp" 2>/dev/null || true

    echo "✅ Added new theme: '$NEW_THEME'"
fi

# Verify the change
if grep -q "ZSH_THEME=\"$NEW_THEME\"" "$ZSHRC_FILE"; then
    echo "✅ Theme successfully set to '$NEW_THEME'"
    echo "To apply changes, run: source ~/.zshrc"
else
    echo "❌ Failed to set theme. Restoring backup..."
    cp "$BACKUP_FILE" "$ZSHRC_FILE"
    exit 1
fi

# Show the current theme line
echo ""
echo "Current theme line:"
grep "ZSH_THEME=" "$ZSHRC_FILE"