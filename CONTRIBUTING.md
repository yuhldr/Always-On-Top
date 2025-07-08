# Contributing to Always On Top

Thank you for your interest in contributing to Always On Top! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Reporting Bugs

1. **Check existing issues** - Search through [existing issues](https://github.com/Siddharthh39/Always-On-Top/issues) to avoid duplicates
2. **Use the bug report template** when creating a new issue
3. **Provide detailed information**:
   - GNOME Shell version
   - Linux distribution and version
   - Steps to reproduce the bug
   - Expected vs actual behavior
   - Screenshots/logs if applicable

### Suggesting Features

1. **Check existing feature requests** in the [issues](https://github.com/Siddharthh39/Always-On-Top/issues)
2. **Create a detailed feature request** including:
   - Clear description of the feature
   - Use case and motivation
   - Possible implementation approach
   - Any mockups or examples

### Code Contributions

#### Development Setup

1. **Fork the repository**
   ```bash
   git clone https://github.com/Siddharthh39/Always-On-Top.git
   cd Always-On-Top
   ```

2. **Install for development**
   ```bash
   # Create a symlink for development
   ln -sf $(pwd) ~/.local/share/gnome-shell/extensions/AlwaysOnTop@Siddharthh39.github.io
   
   # Compile schema
   cd schemas
   glib-compile-schemas .
   ```

3. **Restart GNOME Shell** to load the extension

#### Code Style

- **JavaScript**: Follow the existing code style in the project
- **Indentation**: Use 4 spaces (no tabs)
- **Naming**: Use camelCase for variables and methods
- **Comments**: Add meaningful comments for complex logic
- **File structure**: Keep the existing file organization

#### Key Files

- `extension.js` - Main extension logic
- `prefs.js` - Preferences/settings UI
- `metadata.json` - Extension metadata
- `schemas/` - GSettings schema files
- `icons/` - SVG icons for the extension

#### Making Changes

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the code style guidelines

3. **Test thoroughly**:
   - Test on different GNOME Shell versions (if possible)
   - Test all extension features
   - Test preferences UI
   - Test keyboard shortcuts
   - Test with different panel configurations

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

5. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

#### Commit Message Guidelines

Use conventional commit format:
- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

Examples:
- `feat: add custom keyboard shortcut support`
- `fix: resolve icon not updating on workspace switch`
- `docs: update installation instructions`

## 🧪 Testing

### Manual Testing Checklist

Before submitting a PR, test these scenarios:

#### Basic Functionality
- [ ] Left click toggles window always-on-top
- [ ] Right click opens settings menu
- [ ] Middle click toggles stickiness (when enabled)
- [ ] Keyboard shortcut works correctly

#### Visual Indicators
- [ ] Icon changes correctly for different window states
- [ ] All icon variants display properly
- [ ] No focus icon shows when no window is focused

#### Settings
- [ ] Position setting (left/right) works
- [ ] Rank setting affects panel position
- [ ] Stickiness toggle works
- [ ] Keyboard shortcut customization works
- [ ] Settings persist after restart

#### Edge Cases
- [ ] Works with fullscreen applications
- [ ] Handles multiple monitors correctly
- [ ] Works with workspace switching
- [ ] No conflicts with other extensions

### Automated Testing

Currently, the project uses manual testing. Contributions for automated testing are welcome!

## 📚 Development Resources

### GNOME Shell Extension Development
- [GNOME Shell Extensions Documentation](https://gjs.guide/extensions/)
- [GJS Guide](https://gjs.guide/)
- [GNOME Shell API Reference](https://gjs-docs.gnome.org/)

### Useful Tools
- **Looking Glass**: GNOME Shell's debugging tool (`Alt+F2`, type `lg`)
- **Extension Development Extensions**: 
  - [Extension Manager](https://github.com/mjakeman/extension-manager)
  - [Extensions](https://gitlab.gnome.org/GNOME/gnome-shell/-/tree/main/subprojects/extensions-app)

### Code Examples
- Study existing extensions in `~/.local/share/gnome-shell/extensions/`
- Official GNOME Shell extensions: [GNOME GitLab](https://gitlab.gnome.org/GNOME/gnome-shell-extensions)

## 🐛 Debugging

### Common Development Issues

1. **Extension not loading**
   - Check for syntax errors in JavaScript files
   - Verify schema compilation: `glib-compile-schemas schemas/`
   - Check GNOME Shell logs: `journalctl -f -o cat /usr/bin/gnome-shell`

2. **Settings not working**
   - Ensure schema ID matches metadata.json
   - Recompile schemas after changes
   - Check GSettings key names and types

3. **Icon issues**
   - Verify SVG files are valid
   - Check file paths in code
   - Ensure proper icon theme integration

### Debug Logs

Add debug logging to your code:
```javascript
console.log('Debug message:', variable);
// Or use global.log for older GNOME versions
global.log('Debug message:', variable);
```

View logs:
```bash
journalctl -f -o cat /usr/bin/gnome-shell
```

## 📋 Pull Request Process

1. **Ensure your PR addresses an existing issue** or create one first
2. **Fill out the PR template** completely
3. **Include screenshots** for UI changes
4. **Test on multiple GNOME versions** if possible
5. **Update documentation** if needed
6. **Respond to review feedback** promptly

### PR Review Criteria

- Code quality and style consistency
- Functionality works as expected
- No regression in existing features
- Proper error handling
- Performance considerations
- Security implications

## 🌍 Translation

Currently, the extension has minimal text that could benefit from translation. If you're interested in adding internationalization support:

1. Create an issue to discuss the implementation
2. Consider using gettext for translatable strings
3. Follow GNOME's translation guidelines

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the GNU General Public License v3.0.

## 🙋‍♂️ Questions?

- **General questions**: Create a [Discussion](https://github.com/Siddharthh39/Always-On-Top/discussions)
- **Bug reports**: Create an [Issue](https://github.com/Siddharthh39/Always-On-Top/issues)
- **Feature requests**: Create an [Issue](https://github.com/Siddharthh39/Always-On-Top/issues) with the enhancement label

## 🎉 Recognition

Contributors will be acknowledged in:
- The project README
- Release notes for significant contributions
- Special recognition for major features or fixes

Thank you for contributing to Always On Top! 🚀
