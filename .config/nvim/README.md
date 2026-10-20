# Neovim

Personal Neovim configuration organized into settings, keybindings, plugins, themes, and plugin-specific files.

***Language***
- 🇺🇸 English
- [🇪🇸 Español](./README.es.md)

## Features

- Vim-Plug plugin management.
- CoC completion and language tooling.
- NERDTree, Ranger, and FZF integration.
- Signify Git indicators.
- Commenting, indentation guides, tag closing, and formatting.
- Multiple themes, including TokyoNight, Dracula, Ayu, Material, Monokai, and OneDark.
- Separate behavior for standalone Neovim and VS Code integration.

## Installation

Install [Vim-Plug](https://github.com/junegunn/vim-plug), then open Neovim and run:

```vim
:PlugInstall
```

The main entry point is [`init.vim`](./init.vim). Plugin declarations are in [`vim-plug/plugins.vim`](./vim-plug/plugins.vim).

Review plugin runtime requirements before installing language tooling.
