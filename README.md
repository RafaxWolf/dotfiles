# RafaxWolf's dotfiles

Personal Linux desktop configuration for a keyboard-driven workflow, focused on tiling window managers, terminal tools, development, and security research.

***Language***
- 🇺🇸 English
- [🇪🇸 Español](./README.es.md)

***Quick links***
- [BSPWM](./.config/bspwm/README.md)
- [SXHKD](./.config/sxhkd/README.md)
- [Polybar](./.config/polybar/README.md)
- [Qtile](./.config/qtile/README.md)
- [Kitty](./.config/kitty/README.md)
- [Neovim](./.config/nvim/README.md)
- [Fish](./.config/fish/README.md)
- [Ranger](./.config/ranger/README.md)
- [Rofi](./.config/rofi/README.md)
- [Picom](./.config/picom/README.md)
- [Ghidra](./.config/ghidra/README.md)

## Overview

This repository contains my personal dotfiles and configuration files. The main desktop session is built around **BSPWM**, with **Qtile** available as an alternative window manager.

The repository includes configurations for:

- Tiling window managers and keyboard shortcuts.
- Status bars, application launchers, compositing, and wallpapers.
- Kitty, Zsh, Fish, and terminal utilities.
- Neovim and its plugins, themes, and editor integrations.
- Ranger, Ghidra, and scripts used for development and security labs.

Each major component has its own README with setup notes and configuration details. Start with the component that you want to install instead of linking the entire repository at once.

## Installation

These files are designed for my own system and may contain machine-specific paths, interfaces, fonts, and commands. Review the configuration before using it.

```bash
git clone https://github.com/RafaxWolf/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
```

Back up your existing configuration before creating links:

```bash
mkdir -p "$HOME/dotfiles-backup"
cp -a "$HOME/.config" "$HOME/dotfiles-backup/config-$(date +%Y%m%d-%H%M%S)"
```

Then follow the README for the component you want to configure. A selective symlink approach is recommended:

```bash
mkdir -p "$HOME/.config"
ln -sfn "$PWD/.config/bspwm" "$HOME/.config/bspwm"
ln -sfn "$PWD/.config/sxhkd" "$HOME/.config/sxhkd"
```

Do not link every directory blindly. Some configurations include local paths such as `/home/RafaxWolf` or `/opt/...` that must be changed first.

## Repository layout

| Directory | Documentation |
| --- | --- |
| `.config/bspwm/` | [BSPWM README](./.config/bspwm/README.md) |
| `.config/sxhkd/` | [SXHKD README](./.config/sxhkd/README.md) |
| `.config/polybar/` | [Polybar README](./.config/polybar/README.md) |
| `.config/qtile/` | [Qtile README](./.config/qtile/README.md) |
| `.config/kitty/` | [Kitty README](./.config/kitty/README.md) |
| `.config/nvim/` | [Neovim README](./.config/nvim/README.md) |
| `.config/fish/` | [Fish README](./.config/fish/README.md) |
| `.config/ranger/` | [Ranger README](./.config/ranger/README.md) |
| `.config/rofi/` | [Rofi README](./.config/rofi/README.md) |
| `.config/picom/` | [Picom README](./.config/picom/README.md) |
| `.config/ghidra/` | [Ghidra README](./.config/ghidra/README.md) |

## Important notes

- These are personal dotfiles, not a universal installation script.
- Check absolute paths, monitor names, network interfaces, and keyboard layouts before use.
- Do not commit credentials, API tokens, private keys, or other sensitive data.
- Install only the dependencies required by the component you are configuring.

## License

This project is distributed under the [MIT License](./LICENSE).
