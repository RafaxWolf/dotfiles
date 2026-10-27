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

### 1) Install base packages (Arch Linux)

For this setup, install at least these tools:

```bash
paru -S neovim git curl nodejs npm ripgrep fzf ranger
```

> Some plugins may need extra runtime dependencies depending on your language stack.

### 2) Install Vim-Plug

The Vim-Plug package name can vary by distribution.

#### Option A (Arch Linux / AUR, preferred when available)

```bash
paru -S vim-plug
```

#### Option B (official fallback, works everywhere)

```bash
mkdir -p ~/.local/share/nvim/site/autoload
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This path is for **Neovim** (`~/.local/share/nvim/site/autoload/plug.vim`).

### 3) Install plugins

Open Neovim:

```bash
nvim
```

Run:

```vim
:PlugInstall
```

Then restart Neovim.

Useful Vim-Plug commands:

- `:PlugUpdate` update plugins.
- `:PlugClean` remove plugins not listed anymore.
- `:PlugStatus` check plugin status.

The main entry point is [`init.vim`](./init.vim). Plugin declarations are in [`vim-plug/plugins.vim`](./vim-plug/plugins.vim).

## Shortcuts

`<Leader>` is `\\` in Vim/Neovim by default, unless another config changes it.
In this repository, standalone Neovim sets `mapleader` to `<Space>` (`general/settings.vim`), while VS Code mode can behave differently.

### Global/basic mappings

| Mode | Shortcut | Action | Notes |
| --- | --- | --- | --- |
| Normal | `<C-c>` | Escape (`<Esc>`) | Quick cancel |
| Insert | `jk`, `kj`, `jj`, `kk` | Exit insert mode | Fast Escape alternatives |
| Normal | `<C-s>` | Save (`:w`) | |
| Normal | `<C-q>` | Save and quit (`:wq!`) | |
| Normal | `<C-b>` | Close current buffer (`:bd`) | |
| Normal | `<M-j>`, `<M-k>` | Resize window height | `-2` / `+2` |
| Normal | `<M-h>`, `<M-l>` | Resize window width | `-2` / `+2` |
| Normal | `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | Move between windows | |
| Normal *(not VS Code)* | `<Tab>`, `<S-Tab>` | Next/previous buffer | Only when `!exists('g:vscode')` |
| Visual | `J`, `K` | Move selected lines down/up | Keeps selection |
| Visual | `<`, `>` | Re-indent and keep selection | `gv` |

### Plugin mappings (standalone Neovim)

| Mode | Shortcut | Action | Plugin/Source |
| --- | --- | --- | --- |
| Normal | `<Leader>n` | Toggle NERDTree | NERDTree |
| Normal | `<Leader>e` | `:CocCommand explorer` | CoC explorer |
| Normal | `<Space>r` | Toggle Ranger (`:RnvimrToggle`) | rnvimr |
| Normal | `<Leader>b` | `:Buffers` | FZF |
| Normal | `<Leader>g` | `:Rg` | FZF |
| Normal | `<Leader>t` | `:Tags` | FZF |
| Normal | `<Leader>m` | `:Marks` | FZF |
| Normal | `<Leader>p` | `:Prettier` | prettier.vim mapping |
| Normal/Visual | `<Space>/` | Comment toggle (`:Commentary`) | vim-commentary |
| Normal | `<Leader>gj`, `<Leader>gk` | Next/previous git hunk | vim-signify |

### CoC mappings (standalone Neovim)

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `[g`, `]g` | Previous/next diagnostic |
| Normal | `gd`, `gy`, `gi`, `gr` | Go to definition/type/implementation/references |
| Normal | `K` | Show documentation/hover |
| Normal | `<Leader>rn` | Rename symbol |
| Normal/Visual | `<Leader>a` | Code action (selected/current) |
| Normal | `<Leader>ac` | Code action for current buffer |
| Normal | `<Leader>qf` | Auto-fix current line |
| Visual + Operator-pending | `if`, `af` | Function text objects (inner/around) |
| Visual + Operator-pending | `ic`, `ac` | Class text objects (inner/around) |

### `<Leader>f` mapping collision

`<Leader>f` is mapped in two places:

- CoC: format selected/current (`nmap/xmap <leader>f`)
- FZF: file finder (`map <Leader>f :Files<CR>`)

Because both mappings exist, behavior can differ by mode and mapping precedence/load order.
If needed, inspect with `:verbose map <Leader>f` and `:verbose xmap <Leader>f`.

### VS Code mode

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal (VS Code Neovim integration) | `s` | EasyMotion two-character jump |

Review plugin runtime requirements before installing language tooling.
