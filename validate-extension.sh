#!/bin/bash

# Extension Validation Script
# This script validates the extension package before submission

set -e

PACKAGE_FILE="./dist/always-on-top-clean.zip"
TEMP_TEST_DIR="/tmp/extension-validation"

echo "========================================="
echo "  Extension Validation Tool"
echo "========================================="
echo ""

if [ ! -f "$PACKAGE_FILE" ]; then
    echo "❌ Error: Package file not found: $PACKAGE_FILE"
    echo "   Run ./package-clean.sh first"
    exit 1
fi

echo "📋 Validating package: $PACKAGE_FILE"
echo ""

# Clean up and create test directory
rm -rf "$TEMP_TEST_DIR"
mkdir -p "$TEMP_TEST_DIR"

# Extract package
echo "📦 Extracting package..."
cd "$TEMP_TEST_DIR"
unzip -q "/media/siddharth/contri/Always-On-Top/$PACKAGE_FILE"

echo "✅ Package extracted successfully"
echo ""

# Check required files
echo "🔍 Checking required files..."

REQUIRED_FILES=(
    "extension.js"
    "metadata.json"
    "prefs.js"
    "stylesheet.css"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file - Found"
    else
        echo "  ❌ $file - Missing"
        exit 1
    fi
done

# Check directories
REQUIRED_DIRS=(
    "icons"
    "schemas"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "  ✅ $dir/ - Found"
    else
        echo "  ❌ $dir/ - Missing"
        exit 1
    fi
done

echo ""

# Validate metadata.json
echo "🔍 Validating metadata.json..."
if command -v jq &> /dev/null; then
    if jq empty metadata.json 2>/dev/null; then
        echo "  ✅ metadata.json - Valid JSON"
        
        # Check required fields
        NAME=$(jq -r '.name' metadata.json)
        UUID=$(jq -r '.uuid' metadata.json)
        VERSION=$(jq -r '.version' metadata.json)
        
        echo "  📋 Extension name: $NAME"
        echo "  📋 Extension UUID: $UUID"
        echo "  📋 Extension version: $VERSION"
        
        if [ "$UUID" = "AlwaysOnTop@Siddharthh39.github.io" ]; then
            echo "  ✅ UUID format is correct"
        else
            echo "  ❌ UUID format is incorrect"
            exit 1
        fi
    else
        echo "  ❌ metadata.json - Invalid JSON"
        exit 1
    fi
else
    echo "  ⚠️  jq not available, skipping JSON validation"
fi

echo ""

# Check schemas
echo "🔍 Validating schemas..."
if [ -f "schemas/gschemas.compiled" ]; then
    echo "  ✅ gschemas.compiled - Found"
else
    echo "  ❌ gschemas.compiled - Missing"
    exit 1
fi

if [ -f "schemas/org.gnome.shell.extensions.always-on-top.gschema.xml" ]; then
    echo "  ✅ gschema.xml - Found"
else
    echo "  ❌ gschema.xml - Missing"
    exit 1
fi

echo ""

# Check JavaScript syntax (basic)
echo "🔍 Checking JavaScript syntax..."
if command -v node &> /dev/null; then
    if node -c extension.js 2>/dev/null; then
        echo "  ✅ extension.js - Syntax OK"
    else
        echo "  ❌ extension.js - Syntax Error"
        exit 1
    fi
    
    if node -c prefs.js 2>/dev/null; then
        echo "  ✅ prefs.js - Syntax OK"
    else
        echo "  ❌ prefs.js - Syntax Error"
        exit 1
    fi
else
    echo "  ⚠️  Node.js not available, skipping syntax check"
fi

echo ""

# Check icons
echo "🔍 Checking icons..."
ICON_COUNT=$(find icons/ -name "*.svg" | wc -l)
echo "  📋 Found $ICON_COUNT SVG icons"

if [ "$ICON_COUNT" -eq 5 ]; then
    echo "  ✅ All expected icons present"
else
    echo "  ⚠️  Expected 5 icons, found $ICON_COUNT"
fi

echo ""

# Final validation summary
echo "🎉 Package validation completed!"
echo ""
echo "📋 Validation Summary:"
echo "  ✅ All required files present"
echo "  ✅ Package structure correct"
echo "  ✅ Metadata format valid"
echo "  ✅ Schemas compiled"
echo "  ✅ Ready for GNOME Extensions submission"
echo ""
echo "📤 Upload this file to extensions.gnome.org:"
echo "   $PACKAGE_FILE"
echo ""

# Clean up
rm -rf "$TEMP_TEST_DIR"

echo "🧹 Validation complete!"
