#!/bin/bash

# Package Extension for GNOME Extensions Submission
# This script creates a proper zip file for uploading to extensions.gnome.org

set -e

EXTENSION_UUID="AlwaysOnTop@Siddharthh39.github.io"
TEMP_DIR="/tmp/gnome-extension-package"
DIST_DIR="./dist"
PACKAGE_NAME="always-on-top-extension.zip"

echo "========================================="
echo "  GNOME Extension Packager"
echo "========================================="
echo ""

# Clean up any existing temp directory and create dist directory
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR/$EXTENSION_UUID"
mkdir -p "$DIST_DIR"

echo "📁 Copying extension files..."

# Copy required files
cp metadata.json "$TEMP_DIR/$EXTENSION_UUID/"
cp extension.js "$TEMP_DIR/$EXTENSION_UUID/"
cp prefs.js "$TEMP_DIR/$EXTENSION_UUID/"
cp stylesheet.css "$TEMP_DIR/$EXTENSION_UUID/"
cp settings.ui "$TEMP_DIR/$EXTENSION_UUID/"

# Copy icons directory
cp -r icons/ "$TEMP_DIR/$EXTENSION_UUID/"

# Copy schemas directory
cp -r schemas/ "$TEMP_DIR/$EXTENSION_UUID/"

# Compile schemas
echo "⚙️  Compiling GSettings schema..."
cd "$TEMP_DIR/$EXTENSION_UUID/schemas"
glib-compile-schemas .

echo "📦 Creating package..."
cd "$TEMP_DIR"
zip -r "$PACKAGE_NAME" "$EXTENSION_UUID"

# Move package to the dist directory
mv "$PACKAGE_NAME" "/media/siddharth/contri/Always-On-Top/$DIST_DIR/"

echo "✅ Package created successfully!"
echo ""
echo "📂 Package location: /media/siddharth/contri/Always-On-Top/$DIST_DIR/$PACKAGE_NAME"
echo ""
echo "📋 Upload instructions:"
echo "1. Go to https://extensions.gnome.org/upload/"
echo "2. Upload the file: $DIST_DIR/$PACKAGE_NAME"
echo "3. Fill in the required information"
echo "4. Submit for review"
echo ""

# Clean up
rm -rf "$TEMP_DIR"

echo "🧹 Temporary files cleaned up"
echo "🎉 Ready for submission!"
