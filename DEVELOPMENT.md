# Development Guide

## 🛠️ Development Setup

### Prerequisites
- GNOME Shell 45+ 
- `glib2.0-dev` package for schema compilation
- `git` for version control

### Local Development
1. Clone the repository:
   ```bash
   git clone https://github.com/Siddharthh39/Always-On-Top.git
   cd Always-On-Top
   ```

2. Install for development:
   ```bash
   ./install.sh
   ```

3. Make changes to the code

4. Test changes:
   ```bash
   # Restart GNOME Shell (X11)
   Alt+F2, type 'r', press Enter
   
   # Or reload extension
   gnome-extensions disable AlwaysOnTop@Siddharthh39.github.io
   gnome-extensions enable AlwaysOnTop@Siddharthh39.github.io
   ```

## 📦 Release Process

### 1. Create a New Release

```bash
# Use the release script
./release.sh 2.1

# This will:
# - Update metadata.json version
# - Create extension package
# - Create source package
# - Provide git commands for tagging
```

### 2. Manual Release Steps

1. **Update version in metadata.json**:
   ```json
   {
     "version": 3
   }
   ```

2. **Test the extension**:
   ```bash
   ./package-extension.sh
   # Test the generated package
   ```

3. **Commit and tag**:
   ```bash
   git add .
   git commit -m "Release v2.1"
   git tag v2.1
   git push origin main --tags
   ```

4. **GitHub will automatically**:
   - Create a release
   - Build extension packages
   - Upload assets

### 3. Submit to GNOME Extensions

1. **Package the extension**:
   ```bash
   ./package-extension.sh
   ```

2. **Upload to extensions.gnome.org**:
   - Go to https://extensions.gnome.org/upload/
   - Upload `dist/always-on-top-extension.zip`
   - Fill in the required information

## 🧪 Testing

### Manual Testing Checklist

Before each release, test:

- [ ] Left click toggles always-on-top
- [ ] Right click opens context menu
- [ ] Middle click toggles stickiness (when enabled)
- [ ] Keyboard shortcut works (Super+T)
- [ ] Settings window opens and saves changes
- [ ] All icon states display correctly
- [ ] Extension works across workspace switches
- [ ] Extension survives GNOME Shell restart

### Testing with Different Configurations

Test the extension with:
- Different panel positions (left/right)
- Different panel ranks (0-9)
- Stickiness enabled/disabled
- Custom keyboard shortcuts
- Multiple monitors
- Different GNOME Shell versions

## 🔧 File Structure

```
Always-On-Top/
├── extension.js          # Main extension logic
├── prefs.js             # Preferences/settings UI
├── metadata.json        # Extension metadata
├── settings.ui          # GTK UI definition
├── stylesheet.css       # Extension styles
├── icons/              # SVG icons
├── schemas/            # GSettings schemas
├── install.sh          # Installation script
├── uninstall.sh        # Uninstallation script
├── package-extension.sh # Package for GNOME Extensions
├── release.sh          # Release automation
└── .github/workflows/  # GitHub Actions
```

## 🐛 Debugging

### View Extension Logs
```bash
# GNOME Shell logs
journalctl -f -o cat /usr/bin/gnome-shell

# Or use Looking Glass
# Alt+F2, type 'lg', press Enter
```

### Common Issues

1. **Extension not loading**:
   - Check syntax errors in JavaScript files
   - Verify metadata.json format
   - Check schema compilation

2. **Settings not working**:
   - Verify schema files
   - Check GSettings keys match code

3. **Icons not displaying**:
   - Check SVG file paths
   - Verify icon creation in code

## 📝 Code Style

- Use 4 spaces for indentation
- Use camelCase for variables and methods
- Add meaningful comments for complex logic
- Follow existing code patterns
- Keep lines under 120 characters

## 🚀 Deployment

### GitHub Releases (Automatic)
- Push tags trigger automatic release workflow
- Packages are built and attached to releases

### GNOME Extensions (Manual)
- Use `package-extension.sh` to create package
- Upload manually to extensions.gnome.org

### Local Testing
- Use `install.sh` for local development
- Use `uninstall.sh` to clean up

## 📋 Version Management

Version numbering: `MAJOR.MINOR` or `MAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes, API changes
- **MINOR**: New features, backwards compatible
- **PATCH**: Bug fixes, small improvements

Update version in:
1. `metadata.json` - Extension version
2. Git tags - Release version
3. Release notes - User-facing version
