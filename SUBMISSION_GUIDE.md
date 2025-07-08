# GNOME Extensions Submission Guide

## 📦 Your Extension Package

Your extension has been successfully packaged as: `always-on-top-extension.zip`

## 🚀 Submission Steps

### 1. Prepare for Submission

Before uploading, make sure you have:
- ✅ A valid GNOME Extensions account at [extensions.gnome.org](https://extensions.gnome.org)
- ✅ The packaged zip file: `always-on-top-extension.zip`
- ✅ Screenshots of your extension in action
- ✅ Clear description and documentation

### 2. Upload Process

1. **Go to Upload Page**
   - Visit: https://extensions.gnome.org/upload/
   - Sign in with your account

2. **Upload Extension**
   - Click "Upload Extension" 
   - Select: `always-on-top-extension.zip`
   - Wait for the upload to complete

3. **Fill Extension Information**
   - **Name**: Always On Top
   - **Description**: 
     ```
     Always on top button in the top bar with keyboard shortcuts and stickiness.
     
     Features:
     • Toggle window always-on-top with left click
     • Keyboard shortcut support (default: Super+T)
     • Window stickiness (visible on all workspaces)
     • Visual indicators for different window states
     • Configurable panel position and settings
     • Context menu for quick settings access
     ```
   - **URL**: https://github.com/Siddharthh39/Always-On-Top
   - **Donate URL**: (optional)

### 3. Screenshots

Take screenshots showing:
- The extension icon in the panel
- Different icon states (pinned, unpinned, sticky, no focus)
- The preferences window
- The extension in action

### 4. Version Information

- **Version**: 2
- **GNOME Shell Versions**: 45, 46, 47
- **License**: GPL-3.0

### 5. Submission Guidelines

#### Required Information:
- Clear, descriptive summary
- Detailed feature list
- Installation instructions
- Usage instructions
- Screenshots demonstrating functionality

#### Best Practices:
- Use proper English grammar
- Be specific about what the extension does
- Mention compatibility
- Include troubleshooting info if needed

## 📝 Sample Description

```markdown
# Always On Top

A GNOME Shell extension that adds an always-on-top toggle button to the top panel.

## Features

### Core Functionality
- **Panel Button**: Shows current window state with visual indicators
- **Left Click**: Toggle focused window's "always on top" status
- **Right Click**: Access extension settings
- **Middle Click**: Toggle window stickiness (when enabled)

### Visual Indicators
- **Pinned Icon**: Window is always on top
- **Under Icon**: Window is below other windows
- **Sticky Icons**: Window is visible on all workspaces
- **No Focus Icon**: No window focused or desktop focused

### Keyboard Shortcuts
- **Default**: Super+T to toggle always-on-top
- **Customizable**: Change shortcut in preferences

### Settings
- **Panel Position**: Left or right side
- **Panel Rank**: Position among other panel elements (0-9)
- **Stickiness**: Enable/disable middle-click stickiness feature
- **Keyboard Shortcut**: Customize the toggle hotkey

## Installation

The extension will be automatically installed when enabled from this page.

## Usage

1. Click the panel button to toggle always-on-top for the focused window
2. Right-click for quick access to settings
3. Use Super+T keyboard shortcut for instant toggling
4. Middle-click to make windows visible on all workspaces (when enabled)

## Compatibility

- GNOME Shell 45, 46, 47
- Works with most window managers
- Compatible with other extensions
- Tested with Ubuntu, Fedora, and other GNOME-based distributions

## Support

- Report issues: https://github.com/Siddharthh39/Always-On-Top/issues
- Source code: https://github.com/Siddharthh39/Always-On-Top
```

## 🔍 Review Process

After submission:
1. **Automated Checks**: The system will validate your extension
2. **Manual Review**: A reviewer will check functionality and code
3. **Approval/Feedback**: You'll receive approval or requests for changes
4. **Publication**: Once approved, your extension goes live

## 📋 Common Issues to Avoid

- ❌ Missing metadata.json
- ❌ Incorrect UUID format
- ❌ Missing required files (extension.js, prefs.js)
- ❌ Schema compilation errors
- ❌ Poor code quality or security issues
- ❌ Insufficient documentation

## ✅ Your Extension Status

Your extension package includes:
- ✅ Proper file structure
- ✅ Complete metadata.json
- ✅ Compiled schemas
- ✅ All required files
- ✅ Modern GNOME Shell compatibility
- ✅ Clean, functional code

## 🎉 Ready for Submission!

Your extension is properly packaged and ready for submission to the GNOME Extensions website. Good luck!
