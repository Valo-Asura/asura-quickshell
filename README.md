# Asura Quickshell

Personal Quickshell desktop shell for Hyprland.

This is the standalone public backup of the `nandoroid` shell from my CachyOS/Hyprland setup. It includes the shell UI, services, widgets, scripts, Material-style theming, launcher, dashboard, dock, quick settings, wallpaper tools, notifications, and system monitor panels.

## Status

This repository is highly experimental and unstable. Large parts of the current config were generated or heavily modified with Codex 5.5 while tuning a live desktop, so some features may be incomplete, machine-specific, or broken outside my setup.

Use it as a reference or backup, not as a polished drop-in shell.

## Nandoroid Features

This customized `nandoroid` configuration has been heavily optimized for premium aesthetics, low resource overhead, and tactile touchpad feedback:

- **Hardware-Accelerated Launcher Dial:**
  - GPU-accelerated dial container rotation offloading paint transformations to the GPU, reducing idle CPU usage to ~0%.
  - Real-time upright counter-rotation for labels and icons to stay perfectly horizontal as the dial spins.
  - Shortest-path angular wrapping logic (`targetRotation` tracking) to prevent wild reverse-spinning when wrapping between indices.
  - Calibrated Touchpad/Scroll Swipes mapping a single gesture cycle (360 units) to exactly one full dial rotation detent.
  - Smooth, cinematic deceleration utilizing `Easing.OutQuint` over `450ms`.
- **Tactile App Dock Auto-Hide:**
  - Smart auto-hide mode (hiding when active windows overlap) or always-hide mode.
  - Click-through hidden state edge hover-trigger region (`12px` wide, full scaled height of the dock) utilizing `acceptedButtons: Qt.NoButton` so it never blocks desktop clicks when hidden.
  - 250ms delayed preview hide grace period (`dockPreview.requestHide()`) to bridge the physical screen gap between dock buttons and the window preview popup.
  - Upgraded live window preview on app icon hover with easy one-click activation and window close buttons.
- **Intel Power Profile Syncer:**
  - Real-time sync of `/tmp/intel_mode` state into hardware-level scaling governor, Energy Performance Preferences (EPP), and Intel P-state Turbo Boost toggles for Intel Core CPUs (e.g. i5-12500H).
- **Greetd / Tuigreet Clean Isolation:**
  - Dedicated virtual terminal isolation (`vt = 2` in `/etc/greetd/config.toml`) and systemd override (`Type=idle`) to completely prevent systemd boot logs from interleaving on the login manager page.

## Credits

Thanks to [na-ive](https://github.com/na-ive) for making Nandoroid, which this setup is based on.

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
- Some paths, scripts, app names, and Hyprland IPC calls are tailored for my user/session.
- The full system restore scripts and package manifests live in `asura-system-config`.
