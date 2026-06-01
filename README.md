# Asura Quickshell

Standalone public backup of the `nandoroid` shell configuration for Hyprland/CachyOS.

> [!WARNING]
> This repository is highly experimental and unstable. Significant portions of the config were tuned directly on a live system, meaning some features may be incomplete, machine-specific, or broken outside this setup. Use as a reference/backup, not as a polished drop-in shell.

## Screenshots

![Launcher](screenshots/launcher.png)
![Dashboard](screenshots/dashboard.png)
![Status bar](screenshots/status-bar.png)
![Left dock](screenshots/left-dock.png)

## Install & Run

```bash
# Clone to config path
git clone https://github.com/Valo-Asura/asura-quickshell.git ~/.config/quickshell/nandoroid

# Start shell
quickshell -c nandoroid

# Restart shell after modifications
~/.config/quickshell/nandoroid/scripts/restartshell.sh
```

## Features

- **Launcher Dial:** GPU-accelerated circular dial with counter-rotating labels, shortest-path wrapping, and calibrated touchpad/mouse scroll swipes.
- **Smart Dock:** Overlay auto-hide dock with 250ms gap-hover grace period, full-height click-through edge trigger, and live window previews.
- **Intel Power Syncer:** Real-time cpufreq governor, EPP, and Turbo Boost sysfs syncer daemon for Intel Core (i5-12500H) laptops.
- **Greetd Isolation:** Console-based login manager `tuigreet` cleanly isolated to VT 2 with custom systemd service override.

## Keybinds

- `Super + A` / `Space`: Launcher
- `Super + D`: Dashboard
- `Super + N`: Quick Settings
- `Super + G`: Quick Actions
- `Super + I`: Settings Sidebar
- `Super + W`: System Monitor
- `Super + V`: Clipboard History

## Credits

Thanks to [na-ive](https://github.com/na-ive) for making Nandoroid, which this setup is based on.
