<p align='center'>
        <img src='./Screenshot.svg' width='300'>
</p>


# Always On Top
Always On Top is a GNOME extension that allows applications that don't have the 'Always On Top' feature in their default menus to stay on top of other windows.

## Features

### Panel Button
A button appears on the top panel that shows the current window state:
- **Left click**: Toggle the focused window's "always on top" status
- **Right click**: Open the context menu for quick settings access
- **Middle click**: Toggle window stickiness (visible on all workspaces) - only works when stickiness is enabled in settings

### Visual Indicators
The panel button shows different icons based on the current window state:
- **Pinned icon**: Window is on top
- **Under icon**: Window is not on top
- **Pinned sticky icon**: Window is on top AND visible on all workspaces
- **Under sticky icon**: Window is visible on all workspaces but not on top
- **No focus icon**: No window is focused or desktop is focused

### Keyboard Shortcut
- **Default shortcut**: `Super+T` to toggle pin/unpin the focused window on top
- **Customizable**: Change the keyboard shortcut through the extension preferences

### Stickiness Feature
When enabled, you can make windows "sticky" (visible on all virtual desktops):
- Use middle-click on the panel button to toggle stickiness
- Can be disabled in settings if not needed
- Works independently of the "always on top" feature

### Configurable Settings
Access settings via the extension preferences or right-click the panel button:
- **Position**: Choose whether the button appears on the left or right side of the panel
- **Rank**: Set the position priority (0-9) among other panel elements
- **Stickiness**: Enable/disable the middle-click stickiness feature
- **Keyboard Shortcut**: Customize the hotkey for toggling always-on-top

## Installation

### Method 1: Download from GitHub (Recommended)

1. **Download the extension:**
   ```bash
   wget https://github.com/Siddharthh39/Always-On-Top/archive/refs/heads/main.zip
   ```

2. **Extract and install:**
   ```bash
   unzip main.zip
   cd Always-On-Top-main
   cp -r . ~/.local/share/gnome-shell/extensions/AlwaysOnTop@Siddharthh39.github.io/
   ```

3. **Compile the schema:**
   ```bash
   cd ~/.local/share/gnome-shell/extensions/AlwaysOnTop@Siddharthh39.github.io/schemas
   glib-compile-schemas .
   ```

4. **Restart GNOME Shell:**
   - On **X11**: Press `Alt+F2`, type `r`, and press Enter
   - On **Wayland**: Log out and log back in, or reboot your system

5. **Enable the extension:**
   ```bash
   gnome-extensions enable AlwaysOnTop@Siddharthh39.github.io
   ```

### Method 2: Clone Repository

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Siddharthh39/Always-On-Top.git
   cd Always-On-Top
   ```

2. **Install the extension:**
   ```bash
   cp -r . ~/.local/share/gnome-shell/extensions/AlwaysOnTop@Siddharthh39.github.io/
   ```

3. **Follow steps 3-5 from Method 1**

### Method 3: Manual Installation Script

Create and run this installation script:

```bash
#!/bin/bash
# Always On Top Extension Installer

EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions/AlwaysOnTop@Siddharthh39.github.io"

echo "Installing Always On Top Extension..."

# Create extension directory
mkdir -p "$EXTENSION_DIR"

# Download and extract
wget -O /tmp/always-on-top.zip https://github.com/Siddharthh39/Always-On-Top/archive/refs/heads/main.zip
unzip -q /tmp/always-on-top.zip -d /tmp/
cp -r /tmp/Always-On-Top-main/* "$EXTENSION_DIR/"

# Compile schema
cd "$EXTENSION_DIR/schemas"
glib-compile-schemas .

# Clean up
rm -rf /tmp/always-on-top.zip /tmp/Always-On-Top-main

echo "Extension installed successfully!"
echo "Please restart GNOME Shell and enable the extension:"
echo "  gnome-extensions enable AlwaysOnTop@Siddharthh39.github.io"
```

## Uninstallation

To remove the extension:

```bash
gnome-extensions disable AlwaysOnTop@Siddharthh39.github.io
rm -rf ~/.local/share/gnome-shell/extensions/AlwaysOnTop@Siddharthh39.github.io
```

## Compatibility

> **Tested with:**
> - Ubuntu 23.10+ x86_64
> - GNOME Shell: 45, 46
> - Other Linux distributions with GNOME

> **Note:** 
> - Tested with [DING](https://gitlab.com/rastersoft/desktop-icons-ng) extension - works well! 😉
> - For best experience, use with vanilla GNOME
> - Compatible with most other GNOME extensions

## Usage Tips

1. **Quick Toggle**: Use the keyboard shortcut `Super+T` for instant window pinning
2. **Multi-Desktop Workflow**: Enable stickiness to keep important windows visible across all workspaces
3. **Panel Organization**: Adjust the rank setting to position the button where you prefer it on the panel
4. **Settings Access**: Right-click the panel button for quick access to preferences

## Troubleshooting

### Extension not appearing after installation
- Make sure you restarted GNOME Shell properly
- Check if the extension is enabled: `gnome-extensions list --enabled`
- Verify the extension directory exists and has correct permissions

### Keyboard shortcut not working
- Check if the shortcut conflicts with system shortcuts
- Try setting a different shortcut in the extension preferences
- Ensure the extension is active and enabled

### Settings not saving
- Make sure the schema is compiled correctly
- Check file permissions in the extension directory

## Contributing

Feel free to contribute to this project! You can:
- Report bugs and issues
- Suggest new features
- Submit pull requests
- Improve documentation

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Credits

- Original concept inspired by the need for better window management in GNOME
- Icons and UI design following GNOME Human Interface Guidelines
- Built with love for the GNOME community

---

**Repository**: [https://github.com/Siddharthh39/Always-On-Top](https://github.com/Siddharthh39/Always-On-Top)  
**Author**: [Siddharthh39](https://github.com/Siddharthh39)
