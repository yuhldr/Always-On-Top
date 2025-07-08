#!/bin/bash

# Always On Top Extension Uninstaller
# Author: Siddharthh39
# Repository: https://github.com/Siddharthh39/Always-On-Top

EXTENSION_UUID="AlwaysOnTop@Siddharthh39.github.io"
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions/$EXTENSION_UUID"

echo "========================================="
echo "  Always On Top Extension Uninstaller"
echo "========================================="
echo ""

# Check if extension is installed
if [ ! -d "$EXTENSION_DIR" ]; then
    echo "ℹ️  Extension is not installed or already removed."
    echo "   Directory not found: $EXTENSION_DIR"
    exit 0
fi

echo "🔍 Found extension installation at: $EXTENSION_DIR"
echo ""

# Confirm uninstallation
read -p "Are you sure you want to uninstall Always On Top Extension? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstallation cancelled."
    exit 0
fi

echo ""
echo "🔧 Uninstalling Always On Top Extension..."

# Disable extension if it's enabled
if command -v gnome-extensions &> /dev/null; then
    echo "⏹️  Disabling extension..."
    if gnome-extensions disable "$EXTENSION_UUID" 2>/dev/null; then
        echo "✅ Extension disabled successfully"
    else
        echo "ℹ️  Extension was not enabled or already disabled"
    fi
else
    echo "⚠️  Cannot disable extension automatically (gnome-extensions command not found)"
    echo "   Please disable it manually if it's currently enabled"
fi

# Remove extension directory
echo "🗑️  Removing extension files..."
rm -rf "$EXTENSION_DIR"

if [ ! -d "$EXTENSION_DIR" ]; then
    echo "✅ Extension files removed successfully"
else
    echo "❌ Error: Could not remove extension directory"
    echo "   You may need to remove it manually: $EXTENSION_DIR"
    exit 1
fi

echo ""
echo "✅ Uninstallation completed successfully!"
echo ""
echo "📋 Note: You may want to restart GNOME Shell to ensure all changes take effect:"
echo "   • On X11: Press Alt+F2, type 'r', press Enter"
echo "   • On Wayland: Log out and log back in"
echo ""
echo "🙏 Thank you for using Always On Top Extension!"
