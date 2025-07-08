#!/bin/bash

# Clean Package Extension for GNOME Extensions Submission
# This creates a minimal, clean package for extensions.gnome.org

set -e

EXTENSION_UUID="AlwaysOnTop@Siddharthh39.github.io"
TEMP_DIR="/tmp/gnome-extension-clean"
DIST_DIR="./dist"
PACKAGE_NAME="always-on-top-clean.zip"

echo "========================================="
echo "  Clean GNOME Extension Packager"
echo "========================================="
echo ""

# Clean up and create directories
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"
mkdir -p "$DIST_DIR"

echo "📁 Creating clean extension package..."

# Copy files directly to temp (not in subdirectory first)
cp metadata.json "$TEMP_DIR/"
cp extension.js "$TEMP_DIR/"
cp prefs.js "$TEMP_DIR/"
cp stylesheet.css "$TEMP_DIR/"
cp settings.ui "$TEMP_DIR/"

# Copy directories
cp -r icons/ "$TEMP_DIR/"
cp -r schemas/ "$TEMP_DIR/"

# Compile schemas in temp directory
echo "⚙️  Compiling GSettings schema..."
cd "$TEMP_DIR/schemas"
glib-compile-schemas .

# Create package from temp directory
echo "📦 Creating package..."
cd "$TEMP_DIR"
zip -r "$PACKAGE_NAME" . -x "*.zip"

# Move package to dist directory
mv "$PACKAGE_NAME" "/media/siddharth/contri/Always-On-Top/$DIST_DIR/"

echo "✅ Clean package created successfully!"
echo ""
echo "📂 Package location: $DIST_DIR/$PACKAGE_NAME"
echo ""
echo "📋 This package contains files at root level (no subdirectory)"
echo "   Ready for GNOME Extensions submission"
echo ""

# Clean up
rm -rf "$TEMP_DIR"

echo "🧹 Temporary files cleaned up"
echo "🎉 Clean package ready for submission!"
