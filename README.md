# Asura Quickshell

Personal Quickshell desktop shell for Hyprland.

This is the standalone public backup of the `nandoroid` shell from my CachyOS/Hyprland setup. It includes the shell UI, services, widgets, scripts, Material-style theming, launcher, dashboard, dock, quick settings, wallpaper tools, notifications, and system monitor panels.

## Screenshots

![Launcher](screenshots/launcher.png)

![Dashboard](screenshots/dashboard.png)

![Status bar](screenshots/status-bar.png)

![Left dock](screenshots/left-dock.png)

## Install Path

Clone or copy this repository to:

```bash
~/.config/quickshell/nandoroid
```

Start it with:

```bash
quickshell -c nandoroid
```

Restart after changes:

```bash
~/.config/quickshell/nandoroid/scripts/restartshell.sh
```

## Main Keybinds

These are wired from my Hyprland config:

- `Super + A` or `Super + Space`: launcher
- `Super + D`: dashboard
- `Super + N`: quick settings
- `Super + G`: quick actions
- `Super + I`: settings
- `Super + W`: system monitor
- `Super + V`: clipboard history

## Notes

- Runtime usage history is intentionally excluded from the repo.
- This shell expects Hyprland, Quickshell, PipeWire, NetworkManager, BlueZ, and common desktop portals.
- The full system restore scripts and package manifests live in `asura-system-config`.
