#!/bin/bash

# Always On Top Extension Installer
# Author: Siddharthh39
# Repository: https://github.com/Siddharthh39/Always-On-Top

set -e

EXTENSION_UUID="AlwaysOnTop@Siddharthh39.github.io"
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions/$EXTENSION_UUID"
REPO_URL="https://github.com/Siddharthh39/Always-On-Top"

echo "========================================="
echo "  Always On Top Extension Installer"
echo "========================================="
echo ""

# Check if GNOME Shell is available
if ! command -v gnome-shell &> /dev/null; then
    echo "❌ Error: GNOME Shell is not installed or not in PATH"
    echo "This extension requires GNOME Shell to work."
    exit 1
fi

# Get GNOME Shell version
GNOME_VERSION=$(gnome-shell --version | grep -oP '\d+\.\d+' | head -1)
echo "📋 Detected GNOME Shell version: $GNOME_VERSION"

# Check compatibility
if [[ $(echo "$GNOME_VERSION >= 45" | bc -l) -eq 1 ]]; then
    echo "✅ GNOME Shell version is compatible"
else
    echo "⚠️  Warning: GNOME Shell version might not be fully compatible"
    echo "   Recommended: GNOME 45 or higher"
    echo "   Your version: $GNOME_VERSION"
    read -p "Do you want to continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
fi

echo ""
echo "🔧 Installing Always On Top Extension..."

# Create extension directory
echo "📁 Creating extension directory..."
mkdir -p "$EXTENSION_DIR"

# Download extension
echo "⬇️  Downloading extension from GitHub..."
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

if command -v wget &> /dev/null; then
    wget -q --show-progress "$REPO_URL/archive/refs/heads/main.zip" -O always-on-top.zip
elif command -v curl &> /dev/null; then
    curl -L "$REPO_URL/archive/refs/heads/main.zip" -o always-on-top.zip
else
    echo "❌ Error: Neither wget nor curl is available"
    echo "Please install wget or curl to download the extension"
    exit 1
fi

# Extract and install
echo "📦 Extracting and installing..."
unzip -q always-on-top.zip
cp -r Always-On-Top-main/* "$EXTENSION_DIR/"

# Compile schema
echo "⚙️  Compiling GSettings schema..."
cd "$EXTENSION_DIR/schemas"
if command -v glib-compile-schemas &> /dev/null; then
    glib-compile-schemas .
    echo "✅ Schema compiled successfully"
else
    echo "⚠️  Warning: glib-compile-schemas not found"
    echo "   You may need to install glib2-devel or libglib2.0-dev"
fi

# Clean up
echo "🧹 Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Installation completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Restart GNOME Shell:"
echo "   • On X11: Press Alt+F2, type 'r', press Enter"
echo "   • On Wayland: Log out and log back in"
echo ""
echo "2. Enable the extension:"
echo "   gnome-extensions enable $EXTENSION_UUID"
echo ""
echo "3. Or use GNOME Extensions app to enable it graphically"
echo ""

# Try to enable the extension automatically
if command -v gnome-extensions &> /dev/null; then
    echo "🔄 Attempting to enable extension automatically..."
    if gnome-extensions enable "$EXTENSION_UUID" 2>/dev/null; then
        echo "✅ Extension enabled successfully!"
        echo "   You may need to restart GNOME Shell to see the changes."
    else
        echo "⚠️  Could not enable extension automatically."
        echo "   Please enable it manually after restarting GNOME Shell."
    fi
else
    echo "💡 Use 'gnome-extensions enable $EXTENSION_UUID' to enable the extension"
fi

echo ""
echo "🎉 Thank you for using Always On Top Extension!"
echo "🐛 Report issues: $REPO_URL/issues"
echo "⭐ Star the repository if you like it: $REPO_URL"
