#!/bin/bash

# Quick Release Script
# Usage: ./quick-release.sh 2.2

if [ -z "$1" ]; then
    echo "❌ Error: Version number required"
    echo "Usage: $0 <version>"
    echo "Example: $0 2.2"
    exit 1
fi

VERSION="$1"
TAG="v$VERSION"

echo "🚀 Creating release $TAG..."

# Check if tag already exists
if git tag -l | grep -q "^$TAG$"; then
    echo "⚠️  Tag $TAG already exists!"
    read -p "Do you want to delete and recreate it? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Deleting existing tag..."
        git tag -d "$TAG"
        git push origin ":refs/tags/$TAG"
    else
        echo "❌ Cancelled"
        exit 1
    fi
fi

# Update metadata.json version
echo "📝 Updating metadata.json version to $VERSION..."
sed -i "s/\"version\": [0-9]*/\"version\": $VERSION/" metadata.json

# Commit changes if there are any
if ! git diff --quiet; then
    echo "💾 Committing version update..."
    git add metadata.json
    git commit -m "Version $VERSION"
fi

# Create and push tag
echo "🏷️  Creating tag $TAG..."
git tag "$TAG"

echo "⬆️  Pushing tag to GitHub..."
git push origin "$TAG"

echo "✅ Release $TAG created successfully!"
echo ""
echo "🔗 Check the workflow at:"
echo "   https://github.com/Siddharthh39/Always-On-Top/actions"
echo ""
echo "📦 Once complete, packages will be available at:"
echo "   https://github.com/Siddharthh39/Always-On-Top/releases/tag/$TAG"
