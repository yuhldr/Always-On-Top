#!/bin/bash

# Release Script for Always On Top Extension
# This script helps create versioned releases

set -e

# Extension details
EXTENSION_UUID="AlwaysOnTop@Siddharthh39.github.io"
EXTENSION_NAME="Always On Top"
TEMP_DIR="/tmp/gnome-extension-release"
DIST_DIR="./dist"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}  Always On Top Extension Release Tool${NC}"
echo -e "${BLUE}=========================================${NC}"
echo ""

# Check if version is provided
if [ -z "$1" ]; then
    echo -e "${RED}❌ Error: Version number required${NC}"
    echo "Usage: $0 <version>"
    echo "Example: $0 2.1"
    exit 1
fi

VERSION="$1"
PACKAGE_NAME="always-on-top-v${VERSION}.zip"

echo -e "${YELLOW}📋 Release Details:${NC}"
echo "   Version: $VERSION"
echo "   Package: $PACKAGE_NAME"
echo ""

# Confirm release
read -p "Continue with release v$VERSION? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Release cancelled."
    exit 0
fi

echo ""

# Update metadata.json version
echo -e "${BLUE}📝 Updating metadata.json version...${NC}"
sed -i "s/\"version\": [0-9]*/\"version\": $VERSION/" metadata.json

# Clean up previous builds
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR/$EXTENSION_UUID"
mkdir -p "$DIST_DIR"

echo -e "${BLUE}📁 Copying extension files...${NC}"

# Copy required files
cp metadata.json "$TEMP_DIR/$EXTENSION_UUID/"
cp extension.js "$TEMP_DIR/$EXTENSION_UUID/"
cp prefs.js "$TEMP_DIR/$EXTENSION_UUID/"
cp stylesheet.css "$TEMP_DIR/$EXTENSION_UUID/"
cp settings.ui "$TEMP_DIR/$EXTENSION_UUID/"

# Copy directories
cp -r icons/ "$TEMP_DIR/$EXTENSION_UUID/"
cp -r schemas/ "$TEMP_DIR/$EXTENSION_UUID/"

# Copy documentation for release
cp README.md "$TEMP_DIR/"
cp LICENSE "$TEMP_DIR/"
cp CONTRIBUTING.md "$TEMP_DIR/"

# Compile schemas
echo -e "${BLUE}⚙️  Compiling GSettings schema...${NC}"
cd "$TEMP_DIR/$EXTENSION_UUID/schemas"
glib-compile-schemas .

# Create extension package
echo -e "${BLUE}📦 Creating extension package...${NC}"
cd "$TEMP_DIR"
zip -r "$PACKAGE_NAME" "$EXTENSION_UUID"

# Create source package
echo -e "${BLUE}📦 Creating source package...${NC}"
SOURCE_PACKAGE="always-on-top-source-v${VERSION}.zip"
zip -r "$SOURCE_PACKAGE" . -x "$PACKAGE_NAME"

# Move packages to dist directory
mv "$PACKAGE_NAME" "/media/siddharth/contri/Always-On-Top/$DIST_DIR/"
mv "$SOURCE_PACKAGE" "/media/siddharth/contri/Always-On-Top/$DIST_DIR/"

echo ""
echo -e "${GREEN}✅ Release v$VERSION created successfully!${NC}"
echo ""
echo -e "${YELLOW}📂 Release files:${NC}"
echo "   Extension package: $DIST_DIR/$PACKAGE_NAME"
echo "   Source package:    $DIST_DIR/$SOURCE_PACKAGE"
echo ""
echo -e "${YELLOW}📋 Next steps:${NC}"
echo "1. Test the extension package locally"
echo "2. Commit changes to git:"
echo -e "   ${BLUE}git add .${NC}"
echo -e "   ${BLUE}git commit -m \"Release v$VERSION\"${NC}"
echo -e "   ${BLUE}git tag v$VERSION${NC}"
echo -e "   ${BLUE}git push origin main --tags${NC}"
echo ""
echo "3. Upload to GNOME Extensions:"
echo "   • Go to: https://extensions.gnome.org/upload/"
echo "   • Upload: $DIST_DIR/$PACKAGE_NAME"
echo ""
echo "4. Create GitHub release:"
echo "   • Go to: https://github.com/Siddharthh39/Always-On-Top/releases/new"
echo "   • Tag: v$VERSION"
echo "   • Attach: $DIST_DIR/$PACKAGE_NAME"
echo "   • Attach: $DIST_DIR/$SOURCE_PACKAGE"
echo ""

# Clean up
rm -rf "$TEMP_DIR"

echo -e "${GREEN}🧹 Temporary files cleaned up${NC}"
echo -e "${GREEN}🎉 Release v$VERSION ready!${NC}"
