# RafaxWolf's dotfiles

> Personal Linux desktop configuration focused on tiling window managers, terminal productivity, development, and security tooling.

***Language***
- 🇺🇸 English
- [🇪🇸 Español](./README.es.md)

***Quick links***
- [BSPWM](./.config/bspwm)
- [SXHKD keybindings](./.config/sxhkd/sxhkdrc)
- [Qtile](./.config/qtile/config.py)
- [Polybar](./.config/polybar)
- [Kitty](./.config/kitty)
- [Neovim](./.config/nvim)
- [Fish](./.config/fish)
- [Zsh](./.zshrc)
- [Ranger](./.config/ranger)
- [License](./LICENSE)

## Overview

This repository contains my personal dotfiles and desktop settings. It is intended as a reference and starting point for building a lightweight, keyboard-driven Linux environment. The configuration is primarily organized around **BSPWM**, with an additional **Qtile** configuration included for experimentation or alternate sessions.

The setup combines:

- BSPWM and SXHKD for tiling and keyboard control.
- Polybar, Rofi, Picom, and Feh for the desktop interface.
- Kitty, Zsh, Fish, and Tide/Powerlevel-style prompts for the terminal.
- Neovim with Vim-Plug, language support, fuzzy finding, file navigation, formatting, and themes.
- Networking, VPN, Ethernet, and target-tracking status scripts for security labs and CTF workflows.
- Ghidra, Ranger, and command-line utilities for development and reverse engineering.

> These are personal configurations, not a universal installer. Review every file before using it, especially scripts containing absolute paths or commands that start services and change system state.

## Repository layout

| Path | Purpose |
| --- | --- |
| `.config/bspwm/` | BSPWM startup configuration, desktop rules, environment variables, wallpaper, compositor, and helper scripts. |
| `.config/sxhkd/` | Keyboard shortcuts for launching applications and controlling BSPWM. |
| `.config/polybar/` | Status bars, colors, fonts, launch script, themes, and modules. |
| `.config/qtile/` | Alternate Qtile configuration with layouts, groups, widgets, and keybindings. |
| `.config/kitty/` | Kitty terminal settings, colors, font, shell, and window/tab shortcuts. |
| `.config/nvim/` | Neovim settings, keybindings, themes, plugin declarations, and plugin configuration. |
| `.config/fish/` | Fish aliases, Tide prompt settings, and helper functions. |
| `.config/ranger/` | Ranger configuration and plugin installation helper. |
| `.config/rofi/` | Rofi application launcher configuration. |
| `.config/picom/` | X11 compositor configuration. |
| `.config/ghidra/` | Ghidra user preferences and workspace settings. |
| `.bashrc`, `.zshrc` | Shell aliases, history, completion, prompts, and helper functions. |

## Installation

### 1. Back up your current configuration

Do not replace your existing files without making a backup first:

```bash
mkdir -p "$HOME/dotfiles-backup"
cp -a "$HOME/.config" "$HOME/dotfiles-backup/config-$(date +%Y%m%d-%H%M%S)"
cp -a "$HOME/.zshrc" "$HOME/.bashrc" "$HOME/dotfiles-backup/" 2>/dev/null || true
```

### 2. Clone the repository

```bash
git clone https://github.com/RafaxWolf/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
```

### 3. Review and link the files you need

A selective symlink approach is recommended so you can keep your existing configuration:

```bash
mkdir -p "$HOME/.config"
ln -sfn "$PWD/.config/bspwm" "$HOME/.config/bspwm"
ln -sfn "$PWD/.config/sxhkd" "$HOME/.config/sxhkd"
ln -sfn "$PWD/.config/polybar" "$HOME/.config/polybar"
ln -sfn "$PWD/.config/kitty" "$HOME/.config/kitty"
ln -sfn "$PWD/.config/nvim" "$HOME/.config/nvim"
ln -sfn "$PWD/.config/rofi" "$HOME/.config/rofi"
ln -sfn "$PWD/.config/picom" "$HOME/.config/picom"
```

Only link the shells you actually use. Before enabling the Zsh or Fish configuration, inspect the aliases and update paths that are specific to this machine.

## Main desktop sessions

### BSPWM

BSPWM is the primary window manager configuration. `.config/bspwm/bspwmrc`:

- Starts `sxhkd` when it is not already running.
- Creates ten desktops.
- Sets borders, gaps, split ratio, and window rules.
- Starts Polybar, Picom, VMware integration, and the wallpaper.
- Sets the keyboard layout to `latam`.
- Exports `nvim` as the default editor.

Start BSPWM from your display manager or X session. Make sure `bspwm`, `sxhkd`, `polybar`, `picom`, `feh`, `kitty`, and `rofi` are installed first.

### Qtile

`.config/qtile/config.py` contains an alternate Qtile session with:

- `mod4`/Super as the modifier key.
- Columns and Max layouts.
- Nine groups/workspaces.
- A bottom bar with layout, groups, prompt, window title, systray, clock, and quick exit.
- Keyboard-driven focus, moving, resizing, floating, fullscreen, reload, and shutdown controls.

The Qtile file is based on the default configuration template, so adapt the terminal command and widgets to your system as needed.

## Keybindings

### BSPWM and SXHKD

The most frequently used shortcuts are:

| Shortcut | Action |
| --- | --- |
| `Super + Enter` | Open Kitty |
| `Super + D` | Open Rofi |
| `Super + W` | Close the focused window |
| `Super + Shift + W` | Kill the focused window |
| `Super + M` | Toggle tiled/monocle layout |
| `Super + Q` | Quit BSPWM |
| `Super + Shift + R` | Restart BSPWM |
| `Super + Arrow keys` | Focus a window in a direction |
| `Super + Shift + Arrow keys` | Swap or move a window |
| `Super + 1..9, 0` | Focus desktops 1–10 |
| `Super + Shift + 1..9, 0` | Send the focused window to a desktop |
| `Super + T` | Tiled state |
| `Super + Shift + T` | Pseudo-tiled state |
| `Super + S` | Floating state |
| `Super + F` | Fullscreen state |
| `Super + Alt + Arrow keys` | Resize with the custom BSPWM script |
| `Super + Escape` | Reload SXHKD |

See [`.config/sxhkd/sxhkdrc`](./.config/sxhkd/sxhkdrc) for the complete list.

### Qtile

Qtile uses the same Super modifier convention. Some useful defaults are:

| Shortcut | Action |
| --- | --- |
| `Super + Enter` | Launch the detected terminal |
| `Super + H/J/K/L` | Move focus |
| `Super + Shift + H/J/K/L` | Move windows |
| `Super + Ctrl + H/J/K/L` | Resize windows |
| `Super + Tab` | Switch layout |
| `Super + W` | Close the focused window |
| `Super + F` | Toggle fullscreen |
| `Super + T` | Toggle floating |
| `Super + Ctrl + R` | Reload Qtile |
| `Super + Ctrl + Q` | Exit Qtile |
| `Super + 1..9` | Switch groups |
| `Super + Shift + 1..9` | Move a window to a group |

## Terminal configuration

### Kitty

Kitty is configured with the Hack Nerd Font, a custom color scheme, 95% background opacity, Zsh as the default shell, and shortcuts for neighboring windows, tabs, and windows.

### Zsh

`.zshrc` includes:

- `batcat` and `lsd` aliases for readable file output and directory listings.
- FZF previews using `batcat`.
- Impacket and security-tool aliases.
- `settarget` and `cleartarget` helper functions.
- Completion, history substring search, syntax highlighting, and a custom prompt.

Some aliases reference local installations such as `/opt/Responder` and `/opt/Wolf`; remove or update them if those tools are not installed.

### Fish

Fish includes modern `bat`/`lsd` aliases, Tide prompt configuration, `ncat`/`netexec` shortcuts, and target helper functions. The target functions currently write to a machine-specific path, so update that location before using them on another computer.

## Neovim

The Neovim setup is organized into separate files for settings, keybindings, plugins, themes, and plugin-specific configuration. Plugins are managed with [Vim-Plug](https://github.com/junegunn/vim-plug).

Install Vim-Plug if needed, then open Neovim and run:

```vim
:PlugInstall
```

The configuration includes support for:

- Completion and language tooling through CoC.
- NERDTree and Ranger integration.
- FZF search.
- Git change indicators through Signify.
- Commenting, indentation guides, tag closing, and formatting.
- Multiple themes, including TokyoNight, Dracula, Ayu, Material, Monokai, and OneDark.

## Polybar and helper scripts

The Polybar launcher terminates existing bars and starts separate bars for logs, Ethernet, VPN status, target tracking, workspaces, and primary system information. The BSPWM scripts also provide:

- Dynamic window resizing.
- Ethernet and VPN status indicators.
- A target-to-hack display for lab workflows.
- Launcher and power-menu scripts.

Read the scripts before running them and replace hardcoded paths such as `/home/RafaxWolf` with `$HOME` or the correct path for your user.

## Dependencies

The exact package names depend on your distribution. This setup commonly expects:

- **Window manager:** `bspwm`, `sxhkd`, `qtile`
- **Desktop tools:** `polybar`, `rofi`, `picom`, `feh`
- **Terminal and shell:** `kitty`, `zsh`, `fish`, `lsd`, `bat`, `fzf`
- **Editor:** `neovim`, Vim-Plug, and the language runtimes required by your plugins
- **Utilities:** `ranger`, `git`, Nerd Fonts, and X11 utilities
- **Security/research tools:** `Ghidra`, Impacket, Responder, NetExec, and related tools as needed

Install only what you need and consult your distribution's documentation for current package names.

## Notes

- This repository is tailored to my hardware, display layout, keyboard layout, and installed tools.
- Several configurations contain absolute paths and machine-specific interfaces; update them before reuse.
- The Polybar configuration contains legacy and experimental sections. Validate module names and network interfaces on your system.
- Never commit credentials, API tokens, private keys, or sensitive personal data to a dotfiles repository.

## License

This project is distributed under the [MIT License](./LICENSE).
